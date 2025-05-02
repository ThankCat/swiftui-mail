//
//  DiscoveryViewModel.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/30.
//

import Foundation
import Moya

class DiscoveryViewModel: ObservableObject {
    @Published var datum: [Product] = []
    private var provider = MoyaProvider<MyNetworkService>()

    init() {
        loadData()
    }

    func loadData() {
        
        // 解析用户详情
        provider.request(.userDetail(id: "1")) { result in
            switch result {
                
            case let .success(response):
                let data = response.data
                let statusCode = response.statusCode
                
                print(statusCode)
                
                let resultString = String(data: data, encoding: .utf8)!
                print(resultString)
                if let r = try? response.map(DetailResponse<User>.self) {
                    print(r.data?.detail ?? "")
                }
                
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
        
        // 解析商品列表
//        provider.request(.products(data: ["size": 10, "page": 1])) { result in
//            switch result {
//            case let .success(response):
//                let data = response.data
//                let statusCode = response.statusCode
//                print(statusCode)
//                
//                let resultString = String(data: data, encoding: .utf8)
//                
//                if let r = try? response.map(DetailResponse<NetworkPageData<Product>>.self){
//                    print(r.data?.list ?? [])
//                    print("🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟")
//                    print(r.data?.list?[0].title ?? "")
//                }
//                
//            case let .failure(error):
//                print(error.localizedDescription)
//            }
//        }
    }
}
