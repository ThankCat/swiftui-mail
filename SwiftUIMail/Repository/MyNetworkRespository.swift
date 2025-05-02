//
//  MyNetworkRespository.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/5/2.
//

import Foundation
import Moya

class MyNetworkRespository {
    static let shared = MyNetworkRespository()
    
    private var provider = MoyaProvider<MyNetworkService>.self
    
    private init() {
        // 插件列表
        var plugins: [PluginType] = []
        
        if Config.DEBUG {
            // 添加网络请求成功的日志插件
            plugins.append(NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .successResponseBody)))
        }
    }
}
