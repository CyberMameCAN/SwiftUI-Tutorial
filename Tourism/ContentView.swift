//
//  ContentView.swift
//  Tourism
//
//  Created by としや on 2021/09/02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .featured   // 初期値はFeaturedタブ
    // Tabに関する列挙型
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        // 画面下にフレーの部分が現れる
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
