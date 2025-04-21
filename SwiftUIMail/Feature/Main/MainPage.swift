//
//  MainPage.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/17.
//

import SwiftUI

struct MainPage: View {
    @State private var selectedIndex = 0

    var body: some View {
        TabView(selection: $selectedIndex) {
            DiscoveryPage()
                .tabItem {
                    Image(selectedIndex == 0 ? "HomeSelected" : "Home")
                    Text("Discovery")
                }
                .tag(0).id(0)

            ShortVideoPage()ShortVideoPage
                .tabItem {
                    Image(selectedIndex == 1 ? "HomeSelected" : "Home")
                    Text("Short Video")
                }
                .tag(1).id(1)

            CategoryPage()
                .tabItem {
                    Image(selectedIndex == 2 ? "CategorySelected" : "Category")
                    Text("Category")
                }
                .tag(2).id(2)

            CartPage()
                .tabItem {
                    Image(selectedIndex == 3 ? "CartSelected" : "Cart")
                    Text("Cart")
                }
                .tag(3).id(3)

            MePage()
                .tabItem {
                    Image(selectedIndex == 4 ? "MeSelected" : "Me")
                    Text("Me")
                }
                .tag(4).id(4)
        }
    }
}

#Preview {
    MainPage()
}
