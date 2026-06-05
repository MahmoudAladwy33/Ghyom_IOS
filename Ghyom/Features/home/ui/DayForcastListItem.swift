//
//  DayForcastListItem.swift
//  Ghyom
//
//  Created by Al3dwy on 29/05/2026.
//

import SwiftUI

struct DayForcastListItem: View {
    @State private var showSheet = false
    var dayForecast : Forecastday

    var body: some View {
        VStack{
            HStack{
                Text(getDayName(from: dayForecast.date ?? "") )
                    .font(.system(size: 18, weight: .regular , design: .default))
                    .foregroundStyle(.white)
                    .frame(width: 100, alignment: .leading)
                
                Spacer(minLength: 0)
                AsyncImage(url: URL(string: "https:\(dayForecast.day?.condition?.icon ?? "")"))
                    .scaledToFit()
                    .frame(width: 28, height: 26)
                Spacer(minLength: 10)
                
                Text("\(dayForecast.day?.mintempC  ?? 0 ,  specifier: "%.0f")°")
                    .font(.system(size: 18, weight: .regular , design: .default))
                    .foregroundStyle(.gray)
                    .frame(width: 35, alignment: .trailing)
                
                TemperatureRangeBar(minTemp: dayForecast.day?.mintempC ?? 0, maxTemp: dayForecast.day?.maxtempC ?? 0, currentTemp: dayForecast.day?.avgtempC ?? 0)
                    .padding(.horizontal, 4)
                
                Text("\(dayForecast.day?.maxtempC ?? 0 ,  specifier: "%.0f")°")
                    .font(.system(size: 18, weight: .regular , design: .default ))
                    .foregroundStyle(.white)
                    .frame(width: 35, alignment: .trailing)
            }
            .onTapGesture {
                showSheet = true
            }
            .sheet(isPresented: $showSheet) {
                HourlyForcast(
                    hourList: dayForecast.hour
                )
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
                    .presentationBackground {
                        Image(.hourlyForcastBackground)
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                    }
            }
        } .padding(.horizontal, 8)
    }
}

//#Preview {
//    DayForcastListItem()
//}
