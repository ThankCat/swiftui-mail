//
//  LoginHomePage.swift
//  SwiftUIMail
//
//  Created by HoverCHEN on 2025/7/1.
//

import SwiftUI

struct LoginHomePage: View {
    @StateObject var viewModel = LoginHomeViewModel()

    var body: some View {
        LoginHomePageContent {} toCodeLogin: {} qqLogin: {} wechatLogin: {}
    }
}

struct LoginHomePageContent: View {
    var toLogin: () -> Void
    var toCodeLogin: () -> Void
    var qqLogin: () -> Void
    var wechatLogin: () -> Void

    var body: some View {
        VStack {
            Image("LoginLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(extraSmallShape)
                .padding(.top, 60)

            Spacer()

            // 底部容器
            VStack(spacing: Space4XLarge) {
                // 验证码登陆
                Button(action: toCodeLogin) {
                    Text("Code Login")
                        .frame(maxWidth: .infinity)
                        .frame(height: BUTTON_HEIGHT_MEDDLE)
                        .background(.primaryColor3)
                        .foregroundStyle(.white)
                        .clipShape(extraSmallShape)
                }

                // password 登陆
                Button(action: toLogin) {
                    Text("Password Login")
                        .frame(maxWidth: .infinity)
                        .frame(height: BUTTON_HEIGHT_MEDDLE)
                        .background(.clear)
                        .foregroundStyle(.primaryColor3)
                        .overlay {
                            RoundedRectangle(cornerRadius: smallCornerRadius)
                                .stroke(.primaryColor3, lineWidth: 1)
                        }
                }

                // 其他登陆方式
                HStack(spacing: 0) {
                    OtherLoginButton(icon: "PassportSnsWechat", active: wechatLogin)
                    Spacer()
                    OtherLoginButton(icon: "PassportSnsQQ", active: qqLogin)
                    Spacer()
                    OtherLoginButton(icon: "PassportSnsWeibo", active: {})
                    Spacer()
                    OtherLoginButton(icon: "PassportSnsGoogle", active: {})
                }
            }
        }
        .padding()
    }
}

// MARK: - Other Login Buttons

struct OtherLoginButton: View {
    var icon: String
    var active: () -> Void = {}

    var body: some View {
        Button(action: active) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
//                .onTapGesture {
//                    active()
//                }
        }
    }
}

#Preview {
    LoginHomePageContent {} toCodeLogin: {} qqLogin: {} wechatLogin: {}
}
