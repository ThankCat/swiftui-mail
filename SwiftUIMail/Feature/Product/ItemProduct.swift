//
//  ItemProduct.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/25.
//

import Kingfisher
import SwiftUI

struct ItemProduct: View {
    var data: Product
    var body: some View {
        HStack {

            // MARK: - 商品预览图
            if let icon = data.icon {
                KFImage.url(icon.url)
                    .onProgress { receivedSize, totalSize in }
                    .onSuccess { result in }
                    .onFailure { error in }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .background(.divider)
                    .clipShape(extraSmallShape)
            } else {
                Image("Placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)  // 等比例缩放
                    .frame(width: 120, height: 120)
                    .background(.outline)
                    .clipShape(extraSmallShape)
            }

            VStack(alignment: .leading) {
                // MARK: - 商品标题
                Text(data.title)
                    .font(.titleSmall)
                    .lineLimit(2)
                    .foregroundStyle(.onSurface)
                    .multilineTextAlignment(.leading) // 强制文本左对齐

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
