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
            Color(.red)
                .ignoresSafeArea(edges: .all)
            
            // 静态页面
            StaticContent()
            
            // 广告控件
            MyAdControl(remainingSeconds: 4)
            
        }
    }
}

struct StaticContent: View {
    var body: some View {
        VStack {
            Image("SplashBanner")
                .padding(.top, 120)
            Spacer()
            Image("SplashLogo")
                .padding(.bottom, 20)
            Text(verbatim: "Copyright © 2024 Ixuea. All Rights Reserved")
                .font(.system(size: 12))
                .foregroundStyle(.white)
                .padding(.bottom, 20)
        }
    }
}

struct MyAdControl: View {
    var remainingSeconds: Int
    
    var body: some View {
        VStack {
            
            Text(String(format: LocalizedString(""), remainingSeconds))
            Text("WifiProload")
        }
    }
}

#Preview {
    SplashPage()
}
