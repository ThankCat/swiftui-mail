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
}
