//
//  ProductDetailViewModel.swift
//  SwiftUIMail
//
//  Created by HoverCHEN on 2025/5/7.
//

import Foundation

class ProductDetailViewModel: BaseViewModel {
    var id: String
    
    @Published var data: Product? = nil
    
    init(id: String, data: Product? = nil) {
        self.id = id
        self.data = data
        
        super.init()
        loadData()
    }
    
    func loadData()  {
        
    }
}
