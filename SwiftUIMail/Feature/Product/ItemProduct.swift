//
//  ItemProduct.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/25.
//

import SwiftUI

struct ItemProduct: View {
    var data: Product
    var body: some View {
        HStack {

            // MARK: - 商品预览图
            Image("Placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)  // 等比例缩放
                .frame(width: 120, height: 120)
                .background(.outline)
                .clipShape(extraSmallShape)

            VStack(alignment: .leading) {
                // MARK: - 商品标题
                Text(data.title)
                    .font(.titleSmall)
                    .lineLimit(2)
                    .foregroundStyle(.onSurface)

                SpaceExtraMediumHeightView()

                // MARK: - 商品特点
                Text(data.highlight ?? " ")
                    .font(.bodySmall)
                    .foregroundStyle(.primary)

                SpaceExtraMediumHeightView()

                HStack {
                    // MARK: - 商品折扣价
                    Text(String(format: "¥%.2f", data.priceFloat))
                        .font(.titleMedium)
                        .foregroundStyle(.primaryColor3)
 
                    SpaceMediumWidthView()

                    // MARK: - 商品原价
                    Text(String(format: "¥%.2f", data.originPriceFloat))
                        .font(.bodySmall)
                        .foregroundStyle(.outline)
                        .strikethrough(true, color: .outline)
                }

                SpaceExtraMediumHeightView()

                // MARK: - 商品评价与好评率
                Text(
                    String(
                        format: LocalizedString("Product Info Count"),
                        data.commentsCount, data.commentsRate)
                )
                .font(.bodySmall)
                .foregroundStyle(.outline)

            }
            Spacer()
        }
        .padding(.vertical, SpaceHalfExtraMedium)
        .padding(.horizontal, SpaceExtraMedium)
        .background(.surfaceVariant)

    }
}

#Preview {
    VStack {
        Spacer()
        ItemProduct(data: Product.PREVIEW_DATA)
        Spacer()
    }
    .background(.background2)
}
