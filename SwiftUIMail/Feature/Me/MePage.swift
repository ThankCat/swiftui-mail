//
//  MePage.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/21.
//

import SwiftUI

struct MePage: View {
    var body: some View {
        MePageContent(userInfoClick: {
            AppState.shared.navigate(.LoginHome)
        })
    }
}


struct MePageContent: View {
    var userInfoClick: () -> Void
    
    var body: some View {
        Button(action: userInfoClick) {
            Text("Login")
        }
    }
}

#Preview {
    MePageContent(userInfoClick: {})
}
