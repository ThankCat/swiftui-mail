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
        provider.request(.products(data: ["size": 10, "page": 1])) { result in
            switch result {
            case let .success(response):
                let data = response.data
                let statusCode = response.statusCode
                print(statusCode)
                
                let resultString = String(data: data, encoding: .utf8)
                print(resultString!)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
