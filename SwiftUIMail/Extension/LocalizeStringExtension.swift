//
//  LocalizeStringExtension.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/16.
//

import Foundation

/// 国际化模版字符串
/// - Parameter key: 国际化标识符
/// - Returns: 取出的其中的字符串
func LocalizedString(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}
