//
//  ContentView.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyContentView()
            .navigationDestination(for: NavigationDestination.self) {
                destination in
                switch destination {
                case .ProductDetail(let id):
                    ProductDetailPage(viewModel: .init(id: id))
                case .LoginHome:
                    EmptyView()
                }
            }
    }
}

struct MyContentView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {

        if appState.showSplash {
            SplashPage()
        } else {
            MainPage()
        }

    }
}

#Preview {
    ContentView().environmentObject(AppState.shared)
}
