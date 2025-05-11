//
//  AppState.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/17.
//

import SwiftUI

final class AppState: ObservableObject {

    static let shared = AppState()

    @Published var showSplash: Bool = true

    private init() {}

    func doFinishSplash() {
        self.showSplash = false
    }

    // MARK: - Router
    @Published var rootNavigationPath: [NavigationDestination] = []
    
    
    /// 跳转页面
    /// - Parameter data: 要跳转哪个页面
    func navigate(_ data: NavigationDestination) {
        rootNavigationPath.append(data)
    }
    
    
    /// 关闭页面
    /// - Parameter count: 关闭页面的数量
    func finishPage(_ count: Int = 1) {
        rootNavigationPath.removeLast(count)
    }
}
