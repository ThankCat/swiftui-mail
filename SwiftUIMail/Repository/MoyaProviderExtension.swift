//
//  MoyaProviderExtension.swift
//  SwiftUIMail
//
//  Created by HoverCHEN on 2025/5/5.
//

import Foundation
import Moya

/// 对 MoyaProvider 的扩展，添加一个通用的异步请求方法 `runRequest`
/// 用于发送请求并自动解析响应体为指定的模型类型
extension MoyaProvider {
    
    /// 发起网络请求，并将返回数据解码为指定类型 T
    /// - Parameter target: 请求目标（枚举值，如 .products）
    /// - Returns: 解码后的模型对象，类型为 `T`（继承自 `BaseResponse`）
    func runRequest<T: BaseResponse>(_ target: Target) async throws -> T? {
        do {
            /// 使用 async/await 封装 Moya 的回调方式，转为同步等待结果
            let response = try await withCheckedThrowingContinuation {
                (continuation: CheckedContinuation<Response, Error>) in
                // 使用 Moya 发起请求
                self.request(target) { result in
                    switch result {
                    case .success(let response):
                        // 请求成功，继续返回 response
                        continuation.resume(returning: response)
                    case .failure(let error):
                        // 请求失败，抛出异常
                        continuation.resume(throwing: error)
                    }
                }
            }
            
            // 对响应进行状态码过滤，只允许 200~299 的状态码通过，否则抛出异常
            let filterResponse = try response.filterSuccessfulStatusCodes()

            // 使用 Moya 内置的 map 方法将 JSON 解码为指定类型 T
            let decodedObject = try filterResponse.map(T.self)

            // 业务层错误判断：如果返回的 status 非 0，表示服务器返回了业务错误
            if decodedObject.status != 0 {
                // 抛出业务异常，供上层处理（如弹 toast、重试等）
                throw CommonError.networkResponse(decodedObject)
            }

            // 返回解析成功的数据对象
            return decodedObject
        } catch {
            // 捕获并继续抛出任何错误（网络错误、解码错误、状态码错误等）
            throw error
        }
    }
}
