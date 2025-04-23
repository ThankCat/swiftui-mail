//
//  MyFont.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/23.
//

import SwiftUI

// 扩展系统 Font 结构体，才可以使用.语法设置字体
extension Font {
    static var body2XLargeBold:Font{
        .system(size: 18,weight: .bold)
    }
    static var body6XLargeBold: Font {
        .system(size: 22,weight: .bold)
    }
    static var bodyXLargeBold: Font {
        .system(size: 17,weight: .bold)
    }
    static var body2XLarge: Font {
        .system(size: 18)
    }
    static var body4XLarge: Font {
        .system(size: 20)
    }
    static var titleLarge: Font {
        .system(size: 22)
    }
    static var title3XLarge: Font {
        .system(size: 28)
    }
    static var titleMedium: Font {
        .system(size: 16,weight: .medium)
    }
    static var bodyXLarge: Font {
        .system(size: 17)
    }
    static var titleSmall: Font {
        .system(size: 14,weight: .medium)
    }
    static var bodyXSmall: Font {
        .system(size: 13)
    }
    static var bodyLarge: Font {
        .system(size: 16)
    }
    static var bodyMedium: Font {
        .system(size: 14)
    }
    static var bodySmall: Font {
        .system(size: 12)
    }
    static var body4XLargeBold: Font {
        .system(size: 20,weight: .bold)
    }
}
