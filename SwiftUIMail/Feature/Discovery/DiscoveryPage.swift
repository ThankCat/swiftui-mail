//
//  DiscoveryPage.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/21.
//

import SwiftUI

struct DiscoveryPage: View {
    @StateObject var viewModel: DiscoveryViewModel
    var body: some View {
        DiscoveryPageContent(
            leftClick: {}, searchClick: {}, rightClick: {},
            datum: Product.PREVIEW_DATUM)
    }
}

struct DiscoveryPageContent: View {
    var leftClick: () -> Void
    var searchClick: () -> Void
    var rightClick: () -> Void
    var datum: [Product]

    var body: some View {
        VStack(spacing: 0) {
            DiscoveryNavigationTitle(
                leftClick: {}, searchClick: {}, rightClick: {})
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(
                    spacing: 0,
                    content: {
                        ForEach(datum, id: \.id) { item in
                            ItemProduct(data: item)
                        }
                    })
            }
        }
        .background(.background2)

    }
}

// MARK: - 导航栏
struct DiscoveryNavigationTitle: View {
    var leftClick: () -> Void
    var searchClick: () -> Void
    var rightClick: () -> Void

    var body: some View {
        HStack {
            // 扫描二维码 Button
            Button(action: leftClick) {
                Image(systemName: "qrcode.viewfinder")
                    .font(.body2XLarge)
            }
            .buttonStyle(PlainButtonStyle())

            // 搜索 Button
            Button(action: searchClick) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.bodySmall)
                        .foregroundStyle(.outline)
                    Text(verbatim: "Amy")
                        .font(.bodySmall)
                        .foregroundStyle(.outline)
                }
                .frame(
                    maxWidth: .infinity, minHeight: NavigationBarSearchHeight
                )
                .background(.surfaceVariant)
                .clipShape(extraLargeShape)
            }

            // 消息 Button
            Button(action: rightClick) {
                Image(systemName: "ellipsis.message")
                    .font(.body2XLarge)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .frame(height: NavigationBarHeight)
        .padding(.horizontal, SpaceOuter)
    }
}

#Preview {
    DiscoveryPageContent(
        leftClick: {}, searchClick: {}, rightClick: {},
        datum: Product.PREVIEW_DATUM)
}
