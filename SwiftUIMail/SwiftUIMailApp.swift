//
//  SwiftUIMailApp.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/10.
//

import SwiftUI

@main
struct SwiftUIMailApp: App {
    @ObservedObject var appState = AppState.shared
    var body: some Scene {
        WindowGroup {
            // 使用 NavigtionStack 管理导航路径
            NavigationStack(path: $appState.rootNavigationPath) {
                ContentView()
            }
        }
        .environmentObject(appState)
    }
}
