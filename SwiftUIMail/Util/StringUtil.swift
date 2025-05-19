//
//  StringUtil.swift
//  SwiftUIMail
//
//  Created by HoverCHEN on 2025/5/19.
//

import Foundation

class StringUtil {
    static func formatHTML(_ data: String) -> String {
        var buffer = String(Constant.CONTENT_WRAPPER_START)
        buffer.append(data)
        buffer.append(Constant.CONTENT_WRAPPER_END)
        return buffer
    }
}
