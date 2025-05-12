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
        ProductDetailPageContent(data: viewModel.data)
    }
}

struct ProductDetailPageContent: View {
    var data: Product?
    var body: some View {
        Text(data?.title ?? "加载中")
    }
}

#Preview {
    ProductDetailPageContent(data: .PREVIEW_DATA)
}
