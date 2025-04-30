//
//  MyNetworkService.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/30.
//

import Foundation
import Moya

// 定义网络请求的服务接口
enum MyNetworkService {
    // 获取商品列表，请求参数为字典类型
    case products(data: [String: Any])
    
    // 获取用户详情，请求参数为用户 ID
    case userDetail(id: String)
    
    // 用户注册，请求参数为 User 类型数据
    case register(data: User)
}

// 扩展 MyNetworkService 以遵循 Moya 的 TargetType 协议
extension MyNetworkService: TargetType {
    
    // 设置基础 URL，从配置中读取
    var baseURL: URL {
        return URL(string: Config.ENDPOINT)!
    }

    // 设置每个请求对应的路径
    var path: String {
        switch self {
        case .products:
            return "v1/products/page"         // 商品分页接口
        case .userDetail:
            return "v1/users/info"           // 用户信息接口
        case .register:
            return "v1/users/add"            // 用户注册接口
        }
    }

    // 设置请求方法（GET 或 POST）
    var method: Moya.Method {
        switch self {
        case .products:
            return .get                      // 获取商品使用 GET
        case .userDetail:
            return .get                      // 获取用户详情使用 GET
        case .register:
            return .post                     // 注册用户使用 POST
        }
    }

    // 设置请求任务，包括参数和编码方式
    var task: Moya.Task {
        switch self {
        case .products(let data):
            // 传递查询参数，使用 URL 编码（适用于 GET 请求）
            return .requestParameters(
                parameters: data,
                encoding: URLEncoding.queryString
            )
        case .userDetail:
            // 无需附加参数
            return .requestPlain
        case .register(let data):
            // 将用户数据作为 JSON 编码发送
            return .requestJSONEncodable(data)
        }
    }

    // 设置请求头部信息
    var headers: [String: String]? {
        var headers: [String: String] = [:]
        
        // 设置内容类型为 JSON
        headers["Content-Type"] = "application/json"
        
        return headers
    }
}
