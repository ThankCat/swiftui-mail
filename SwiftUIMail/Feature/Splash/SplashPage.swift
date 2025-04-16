//
//  SplashPage.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/15.
//

import SwiftUI

struct SplashPage: View {
    var body: some View {
        ZStack {
            // 背景色
            Color(.primaryColor2)
                .ignoresSafeArea(edges: .all)
            
            // 静态页面
            StaticContent(year: SuperDateUtil.currentYear())
            
            // 广告控件
            MyAdControl(remainingSeconds: 4)
            
        }
    }
}

struct StaticContent: View {
    let year: Int
    
    var body: some View {
        VStack {
            Image("SplashBanner")
                .padding(.top, 120)
            Spacer()
            Image("SplashLogo")
                .padding(.bottom, 20)
            Text(verbatim: "Copyright © \(year) Ixuea. All Rights Reserved")
                .font(.system(size: 12))
                .foregroundStyle(.white)
                .padding(.bottom, 20)
        }
    }
}

struct MyAdControl: View {
    // 获取环境变量中的颜色模式
    @Environment(\.colorScheme) var colorScheme
    
    var remainingSeconds: Int
    
    var body: some View {
        VStack {
            
            Text(String(format: LocalizedString("SkipADCount"), remainingSeconds))
            Text("WifiProload")
            
            // 判断颜色模式
            switch colorScheme {
            case .light:
                Text(verbatim: "浅色模式")
            case .dark:
                Text(verbatim: "深色模式")
            @unknown default:
                Text(verbatim: "未知模式")
            }
        }
    }
}

#Preview {
    SplashPage()
}
