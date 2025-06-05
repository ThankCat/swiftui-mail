//
//  MyProductDetailBottomBar.swift
//  SwiftUIMail
//
//  Created by HoverCHEN on 2025/6/5.
//

import Foundation
import SwiftUI

/// 商品详情底部按钮
struct MyProductDetailBottomBar<Content: View>: View {
    var primaryClick: () -> Void
    var addCartClick: () -> Void
    var left: (() -> Content)? = nil

    var body: some View {
        VStack {
            SpaceExtraSmallHeightView()

            HStack(spacing: 0) {
                if let left = left {
                    left()
                }

                HStack(spacing: 0) {
                    // 加入购物车按钮
                    Button(action: addCartClick) {
                        Text("Add Cart")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: BUTTON_HEIGHT)
                            .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing))
                            .foregroundStyle(.white)
                            .clipShape(
                                RoundedCornersShape(
                                    corners: [.topLeft, .bottomLeft],
                                    radius: largeCornerRadius
                                )
                            )
                    }
                    
                    Button(action: primaryClick) {
                        Text("Buy Now")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: BUTTON_HEIGHT)
                            .background(LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .leading, endPoint: .trailing))
                            .foregroundStyle(.white)
                            .clipShape(
                                RoundedCornersShape(
                                    corners: [.topRight, .bottomRight],
                                    radius: largeCornerRadius
                                )
                            )
                    }
                }
            }
        }
        .padding(.horizontal, SpaceOuter)
        .padding(.vertical, SpaceSmall)
        .background(.surfaceVariant)
    }
}

/// 自定义Shape已实现特定边角的圆角
struct RoundedCornersShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
