//
//  ViewModel.swift
//  CustomTabBar
//
//  Created by Enrique Poyato Ortiz on 20/9/23.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var tabBarItems: [(image: String, title: String)]?
    
    init() {
        self.tabBarItems = [
            ("house", "Home"),
            ("magnifyingglass", "Search"),
            ("heart", "Favorites"),
            ("person", "Profile"),
            ("gear", "Settings")
        ]
    }
}
