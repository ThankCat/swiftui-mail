//
//  DiscoveryPage.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/21.
//

import SwiftUI

struct DiscoveryPage: View {
    var body: some View {
        DiscoveryPageContent(leftClick: {}, searchClick: {}, rightClick: {})
    }
}

struct DiscoveryPageContent: View {
    var leftClick: () -> Void
    var searchClick: () -> Void
    var rightClick: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            DiscoveryNavigationTitle(leftClick: {}, searchClick: {}, rightClick: {})
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0, content: {
                    ForEach(1...1000, id: \.self) { count in
                        Text("PlaceHolder \(count)")
                    }
                })
            }
        }
        
    }
}

// MARK: - 导航栏
struct DiscoveryNavigationTitle: View {
    var leftClick: () -> Void
    var searchClick: () -> Void
    var rightClick: () -> Void
    
    var body: some View {
        HStack {
            
            // 扫描二维码 Button
            Button(action: leftClick) {
                Image(systemName: "qrcode.viewfinder")
                    .font(.system(size: 18))
            }
            .buttonStyle(PlainButtonStyle())
            
            // 搜索 Button
            Button(action: searchClick) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 12))
                        .foregroundStyle(.outline)
                    Text(verbatim: "Amy")
                        .font(.system(size: 12))
                        .foregroundStyle(.outline)
                }
                .frame(maxWidth: .infinity, minHeight: 35)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            
            // 消息 Button
            Button(action: rightClick) {
                Image(systemName: "ellipsis.message")
                    .font(.system(size: 18))
            }
            .buttonStyle(PlainButtonStyle())
        }
        .frame(height: 44)
        .padding(.horizontal, 16)
    }
}


#Preview {
    DiscoveryPageContent(leftClick: {}, searchClick: {}, rightClick: {})
}
