//
//  MyNetworkRespository.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/5/2.
//

import Foundation
import Moya // 引入 Moya 框架，用于简化网络请求

/// 网络请求仓库类，使用 Moya 封装的网络请求层
class MyNetworkRespository {
    
    /// 单例对象，确保全局只存在一个网络请求实例
    static let shared = MyNetworkRespository()

    /// Moya 的提供者对象，用于发起网络请求，参数为自定义的目标类型 `MyNetworkService`
    private var provider: MoyaProvider<MyNetworkService>

    /// 私有构造函数，配合单例模式使用
    private init() {
        // 初始化插件数组（Moya 支持插件机制）
        var plugins: [PluginType] = []

        // 如果处于调试模式（DEBUG 为 true），添加网络日志插件
        if Config.DEBUG {
            plugins.append(
                NetworkLoggerPlugin(
                    configuration: NetworkLoggerPlugin.Configuration(
                        logOptions: .successResponseBody // 仅打印成功响应的 body
                    )
                )
            )
        }

        /// 自定义请求构造闭包，用于设置请求属性，例如超时时间
        let requestClosure = {
            (
                endpoint: Endpoint,
                done: @escaping MoyaProvider<MyNetworkService>.RequestResultClosure
            ) in
            do {
                // 从 endpoint 生成 URLRequest
                var request = try endpoint.urlRequest()
                request.timeoutInterval = 5 // 设置请求超时时间为 5 秒
                done(.success(request)) // 成功则继续请求
            } catch {
                // 失败则封装为 MoyaError 并传递出去
                done(.failure(MoyaError.underlying(error, nil)))
            }
        }

        // 初始化 MoyaProvider，传入请求构造器与插件
        provider = MoyaProvider<MyNetworkService>(
            requestClosure: requestClosure,
            plugins: plugins
        )
    }

    /// 请求商品列表接口
    /// - Parameters:
    ///   - page: 当前页码，默认值为 1
    ///   - size: 每页商品数量，默认值为 10
    ///   - query: 可选的查询关键词（如商品名称）
    /// - Returns: 返回一个包装了分页商品数据的异步响应
    public func products(page: Int = 1, size: Int = 10, query: String? = nil)
        async throws -> DetailResponse<NetworkPageData<Product>>?
    {
        // 构建请求参数字典
        var params: [String: Any] = [
            "page": page,           // 页码
            "size": size,           // 每页数量
            "app": Constant.VALUE0, // 固定 app 参数（通常用于识别客户端）
        ]

        // 如果传入了 query 参数，添加到请求参数中
        if let query = query {
            params["query"] = query
        }

        // 发送网络请求，调用自定义扩展方法 runRequest
        // .products(data:) 是 MyNetworkService 枚举中的某个 case，表示商品列表请求
        let r: DetailResponse<NetworkPageData<Product>>?  = try await provider.runRequest(.products(data: params))
        
        // 返回响应结果
        return r
    }
    
    
    /// 请求商品详情
    /// - Parameter id: 商品ID
    /// - Returns: 返回商品详情的异步响应
    public func productDetail(_ id: String) async throws -> DetailResponse<Product>? {
        return try await provider.runRequest(.productDetail(id: id))
    }
}
