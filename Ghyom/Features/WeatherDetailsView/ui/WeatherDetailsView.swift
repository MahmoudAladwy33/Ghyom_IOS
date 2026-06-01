//
//  WeatherDetailsView.swift
//  Ghyom
//
//  Created by Al3dwy on 29/05/2026.
//

import SwiftUI

struct WeatherDetailsView: View {
    var body: some View {
        ZStack {
            Image(.appBackgroundNight)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            ScrollView(.vertical , showsIndicators: false) {
                VStack(spacing: 30) {
                    WeatherDetailsHeader()
                    WeatherDetailsGridView()
                    Spacer()
                }
                .padding(.top, 80)
            }
            
            
        }
    }
}

#Preview {
    WeatherDetailsView()
}
