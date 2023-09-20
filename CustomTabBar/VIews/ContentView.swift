//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Enrique Poyato Ortiz on 20/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @Namespace private var animationNamespace
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            Text("Tab Content 1")
                .tag(0)
            Text("Tab Content 2")
                .tag(1)
            Text("Tab Content 3")
                .tag(2)
            Text("Tab Content 4")
                .tag(3)
            Text("Tab Content 5")
                .tag(4)
        }
        .ignoresSafeArea()
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.easeInOut, value: selectedTab)
        .overlay(alignment: .bottom) {
            CustomTabView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentView()
}
