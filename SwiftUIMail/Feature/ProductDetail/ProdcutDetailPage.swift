//
//  ProdcutDetailPage.swift
//  SwiftUIMail
//
//  Created by HoverCHEN on 2025/5/7.
//

import SwiftUI

struct ProductDetailPage: View {
    @StateObject var viewModel: ProductDetailViewModel
    var body: some View {
        Text(viewModel.id)
//        ProductDetailPageContent()
    }
}

struct ProductDetailPageContent: View {
    var body: some View {
        Text("商品详情")
    }
}

#Preview {
    ProductDetailPageContent()
}
