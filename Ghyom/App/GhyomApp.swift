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
    
    
    var body: some Scene {
       
        WindowGroup {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                    .tag(0)
                
                HourlyForcast()
                    .tabItem {
                        Image(systemName: "heart.fill")
                    }
                    .tag(1)
                  
            } 
        }
    }
}
