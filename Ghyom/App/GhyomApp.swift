//
//  GhyomApp.swift
//  Ghyom
//
//  Created by Al3dwy on 28/05/2026.
//

import SwiftUI

@main
struct GhyomApp: App {
    @State var selectedTab = 0
    @State var selectedCity: SavedCity? = nil
    
    var body: some Scene {
       
        WindowGroup {
            TabView(selection: $selectedTab) {
                HomeView(selectedCity: $selectedCity)
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                    .tag(0)
                
                FavView(selectedTab: $selectedTab, selectedCity: $selectedCity)
                    .tabItem {
                        Image(systemName: "star.fill")
                    }
                    .tag(1)
            } 
        }
    }
}
