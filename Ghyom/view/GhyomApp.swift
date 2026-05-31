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
                        Label("", systemImage: "house.fill")
                    }
                    .tag(0)
                
                WeatherDetailsView()
                    .tabItem {
                        Label("", systemImage: "list.bullet")
                    }
                    .tag(1)
            }
        }
    }
}
