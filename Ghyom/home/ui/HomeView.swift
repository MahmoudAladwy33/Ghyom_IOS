//
//  ContentView.swift
//  Ghyom
//
//  Created by Al3dwy on 28/05/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Image(.appBackgroundNight)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            ScrollView(.vertical , showsIndicators: false) {
                
                VStack(spacing: 60) {
                    CurrentWeatherSummary()
                    HourlyForcast()
                    DaysForcast()
                    Spacer()
                }
                .padding(.top, 50)
            }
            
            
        }
        
    }
}

#Preview {
    HomeView()
}
