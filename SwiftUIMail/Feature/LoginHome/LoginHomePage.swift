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
        LoginHomePageContent(toLogin: {},
                             toCodeLogin: {},
                             qqLogin: {},
                             wechatLogin: {})
//            .navigationTitle("Login Home")
            .navigationBarBackButtonHidden(true)
            .toolbar{
                MyBackButton()
            }
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

                // 用户协议
                UserAgreement()
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

// MARK: - 用户协议

struct UserAgreement: View {
    var body: some View {
        Text(makeAttributedText())
            .font(.bodySmall)
            .foregroundStyle(.outline)
    }

    /// 创建用户协议的富文本
    /// - Returns: 返回一个包含用户协议和隐私政策链接的富文本字符串
    private func makeAttributedText() -> AttributedString {
        // 使用 LocalizedString 来获取本地化字符串
        let userAgreementStart = LocalizedString("User Agreement Start")
        let userAgreement = LocalizedString("User Agreement")
        let privacyPolicy = LocalizedString("Privacy Policy")
        let and = LocalizedString("User Agreement And")

        // 拼接字符串
        let userAgreementString = "\(userAgreementStart)\(userAgreement)\(and)\(privacyPolicy)"

        // 创建一个 AttributedString 对象
        var attributedString = AttributedString(userAgreementString)

        // 设置链接
        attributedString.linkAttributedString(for: userAgreement, url: Config.LINK_USER_USER_AGREEMENT.url)
        attributedString.linkAttributedString(for: privacyPolicy, url: Config.LINK_USER_PRIVACY_POLICY.url)

        return attributedString
    }
}

#Preview {
    LoginHomePageContent {} toCodeLogin: {} qqLogin: {} wechatLogin: {}
}
