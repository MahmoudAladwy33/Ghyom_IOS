//
//  HourlyForcast.swift
//  Ghyom
//
//  Created by Al3dwy on 28/05/2026.
//

import SwiftUI

struct HourlyForcast: View {
    var hourList : [DayForecastCurrent]
    var body: some View {
        ScrollView(.vertical , showsIndicators: false) {
            VStack(spacing: 25){
                HStack{
                    Text("Hourly Forecast")
                        .font(.system(size: 18, weight: .bold , design: .default ))
                        .foregroundStyle(.white)
                    Spacer()
                }.padding(.horizontal, 20)
                
                
                LazyVStack(spacing: 26) {
                    ForEach(hourList) { singleHour in
                        HourlyForcastListItem(
                            hourlyForcast: singleHour
                        )
                    }
                }
                .padding(.horizontal, 50)
                
            }.padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.ultraThinMaterial.opacity(0.2))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.white.opacity(0.15), lineWidth: 1)
                )
               
        }
    }
}

//#Preview {
//    HourlyForcast()
//}
