//
//  MyBackButton.swift
//  SwiftUIMail
//
//  Created by HoverCHEN on 2025/7/3.
//

import Foundation
import SwiftUI

/// 自定义返回按钮
/// - Parameter action: 点击返回按钮时的回调，默认返回上一页
struct MyBackButton: ToolbarContent {
    var action: (() -> Void?)? = nil
    
    /// 创建一个自定义返回按钮
    var body: some ToolbarContent {
        
        // 使用 ToolbarItem 来添加自定义按钮到导航栏
        ToolbarItem(placement: .topBarLeading) {
            Button {
                if let action = action {
                    action()
                } else {
                    AppState.shared.finishPage()
                }
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.onSurface)
            }
            .buttonStyle(PlainButtonStyle())

        }
    }
}

