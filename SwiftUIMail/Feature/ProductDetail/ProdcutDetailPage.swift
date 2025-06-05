//
//  ProdcutDetailPage.swift
//  SwiftUIMail
//
//  Created by HoverCHEN on 2025/5/7.
//

import Kingfisher
import RichText
import SwiftUI

struct ProductDetailPage: View {
    @StateObject var viewModel: ProductDetailViewModel
    var body: some View {
        ProductDetailPageContent(
            data: .PREVIEW_DATA,
            primaryClick: {},
            addCartClick: {},
            chartClick: {},
            backClick: {
                AppState.shared.finishPage()
            }
        )
        .background(.background2)
        .navigationBarBackButtonHidden()
    }
}

struct ProductDetailPageContent: View {
    var data: Product?
    var primaryClick: () -> Void
    var addCartClick: () -> Void
    var chartClick: () -> Void
    var backClick: () -> Void

    @State var scrollOffset: CGFloat = 0

    var body: some View {
        ZStack {
            if let data {
                VStack(spacing: 0) {
                    ScrollView {
                        VStack(spacing: 0) {
                            // 顶部轮播图
                            ProductDetailBanner(datum: data.icons)

                            // 商品详情
                            ProductDetailInfo(data: data)

                            // 地址
                            SpaceExtraMediumView()
                            MyProductSettingItem(
                                title: LocalizedString("SentTo"),
                                value: "四川省 成都市 高新区"
                            )

                            // 店铺
                            SpaceExtraMediumView()
                            MyProductSettingItem(
                                title: LocalizedString("Store"),
                                value: "小米之家成都印象城专卖店"
                            )

                            // 商家信息
                            SpaceExtraMediumView()
                            MerchantInfo(data: data.user ?? User.PREVIEW_DATA)

                            // 富文本 TODO: 去除图片之间的分割线
                            SpaceExtraMediumView()
                            RichText(
                                html: StringUtil.formatHTML(data.detail ?? "")
                            )
                            .colorScheme(.auto)
                            .fontType(.system)
                            .foregroundColor(
                                light: Color.primary,
                                dark: Color.primary
                            )
                            .linkColor(light: Color.blue, dark: Color.blue)
                            .colorPreference(forceColor: .onlyLinks)
                            .linkOpenType(.SFSafariView())
                            .customCSS("")
                            .placeholder {
                                Text("Loading")
                            }
                            .transition(.easeOut)

                            SpaceExtraMediumView()

                        }
                    }

                    // 底部按钮
                    MyProductDetailBottomBar(
                        primaryClick: primaryClick,
                        addCartClick: addCartClick
                    ) {
                        HStack {
                            Button(action: chartClick) {
                                VStack {
                                    Image(systemName: "headphones")
                                    Spacer().frame(height: 3)
                                    Text("Customer Service")
                                        .font(.bodySmall)
                                        .foregroundStyle(.onSurface)
                                }
                                .foregroundStyle(.onSurface)
                            }

                            SpacerOuterWidthView()

                            Button(action: {}) {
                                VStack {
                                    Image(systemName: "cart")
                                    Spacer().frame(height: 3)
                                    Text("Cart")
                                        .font(.bodySmall)
                                        .foregroundStyle(.onSurface)
                                }
                                .foregroundStyle(.onSurface)
                            }

                            SpacerOuterWidthView()
                        }
                    }

                }
                .ignoresSafeArea(edges: .top)

                // 导航栏
                ProdcutDettailNavigationBar(
                    backClick: backClick,
                    scrollOffset: scrollOffset,
                    id: data.id
                )
            }

        }
    }
}

// MARK: - 导航栏
struct ProdcutDettailNavigationBar: View {
    var backClick: () -> Void
    var scrollOffset: CGFloat
    var id: String

    var body: some View {
        let iconColor: Color = .white

        VStack {
            HStack {
                Button(action: backClick) {
                    Image(systemName: "chevron.left.circle.fill")
                        .foregroundStyle(iconColor)
                        .font(.title3XLarge)
                }

                Spacer()

                Button(action: backClick) {
                    Image(systemName: "square.and.arrow.up.circle.fill")
                        .foregroundStyle(iconColor)
                        .font(.title3XLarge)
                }
            }
            .padding(.horizontal, SpaceOuter)
            .frame(height: NavigationBarHeight)
            .background(.white.opacity(0.5))

            Spacer()
        }

    }
}

// MARK: - 轮播图
struct ProductDetailBanner: View {
    var datum: [String]

    var body: some View {
        // 使用 TabView 实现图片轮播图
        TabView {
            ForEach(datum, id: \.self) { item in
                // 使用 GeometryReader 获取父视图宽度，以实现等宽等高的正方形图片展示
                GeometryReader { geometry in
                    if let url = item.url {
                        KFImage.url(url)  // 使用 Kingfisher 加载网络图片
                            .resizable()
                            .aspectRatio(contentMode: .fill)  // 保持填充，但可能会裁剪
                            .frame(
                                width: geometry.size.width,  // 宽度 = 父视图宽度
                                height: geometry.size.width  // 高度同样设为宽度，实现正方形
                            )
                            .background(.divider)  // 添加背景色（通常用于占位或分割）
                    } else {
                        Image("Placeholder")  // 本地占位图
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(
                                width: geometry.size.width,
                                height: geometry.size.width
                            )
                            .background(.divider)
                    }
                }

            }
        }
        .tabViewStyle(.page)  // 轮播图样式
        .aspectRatio(1, contentMode: .fill)
    }
}

// MARK: - 商品详情
struct ProductDetailInfo: View {
    var data: Product

    var body: some View {
        VStack(alignment: .leading, spacing: SpaceMedium) {
            HStack {

                // 折扣价
                Text(String(format: "¥%.2f", data.priceFloat))
                    .font(.largeTitle)
                    .foregroundStyle(.primaryColor3)

                SpaceSmallWidthView()

                // 原价
                Text(String(format: "¥%.2f", data.originPriceFloat))
                    .font(.body)
                    .foregroundStyle(.outline)
                    .strikethrough()

                Spacer()

            }

            // 商品名称
            Text(data.title)
                .font(.titleMedium)
                .foregroundStyle(.onSurface)

            // 商品亮点💡
            if let highlight = data.highlight {
                Text(highlight)
                    .font(.bodySmall)
                    .foregroundStyle(.primary)
            }

            // 模版字符串 评价和好评
            Text(
                String(
                    format: LocalizedString("Product Info Count"),
                    data.commentsCount,
                    data.commentsRate
                )
            )
            .font(.bodySmall)
            .foregroundStyle(.outline)
        }
        .padding(SpaceOuter)
        .background(.surfaceVariant)

    }
}

// MARK: - 虚拟多选
struct MyProductSettingItem: View {
    var title: String
    var value: String

    var body: some View {
        HStack {
            Text(title)
                .font(.titleSmall)
                .foregroundStyle(.onSurface)
                .frame(minWidth: 80, alignment: .leading)

            Text(value)
                .font(.bodyMedium)
                .foregroundStyle(.onSurface)
                .frame(maxWidth: .infinity, alignment: .leading)

            ArrowIcon()

        }
        .padding(.horizontal, SpaceOuter)
        .padding(.vertical, SpaceExtraOuter)
        .background(.surfaceVariant)
    }
}

// MARK: - 商家信息
struct MerchantInfo: View {
    var data: User
    var body: some View {
        HStack {
            if let icon = data.icon?.url {
                KFImage.url(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(extraSmallShape)
            } else {
                Image("DefaultAvatar")
                    .resizable()
                    .frame(width: 65, height: 65)
                    .clipShape(extraSmallShape)
            }

            VStack(alignment: .leading) {
                Text(data.nicknameFormat)
                    .font(.bodyXLargeBold)
                    .foregroundStyle(.onSurface)

                SpaceMediumHeightView()

                Text("人生苦短 我用Python")
                    .font(.bodyMedium)
                    .foregroundStyle(.outline)
            }

            Spacer()

            ArrowIcon()
        }
        .padding(.horizontal, SpaceOuter)
        .padding(.vertical, SpaceExtraOuter)
        .background(.surfaceVariant)
    }
}

#Preview {
    ProductDetailPageContent(
        data: .PREVIEW_DATA,
        primaryClick: {},
        addCartClick: {},
        chartClick: {},
        backClick: {
            AppState.shared.finishPage()
        }
    )
    .background(.background2)
}
