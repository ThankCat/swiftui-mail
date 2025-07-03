//
//  AttributedStringExtension.swift
//  SwiftUIMail
//
//  Created by HoverCHEN on 2025/7/3.
//

import Foundation

extension AttributedString {
    mutating func linkAttributedString(for text: String, url: URL?) {
        if let range = self.range(of: text), let url = url {
            self[range].link = url // 设置链接
            self[range].foregroundColor = .primaryButton // 设置链接颜色
        }
    }
}
