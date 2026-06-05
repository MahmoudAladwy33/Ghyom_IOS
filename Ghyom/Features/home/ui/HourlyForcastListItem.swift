//
//  HourlyForcastListItem.swift
//  Ghyom
//
//  Created by Al3dwy on 28/05/2026.
//

import SwiftUI

struct HourlyForcastListItem: View {
    var hourlyForcast: DayForecastCurrent
    var body: some View {
        HStack(spacing: 15){
            Text(getHourName(from: hourlyForcast.time ?? ""))
                .font(.system(size: 22, weight: .regular , design: .default ))
                .foregroundStyle(.white)
                .frame(width: 70, alignment: .leading)
            Spacer(minLength: 0)
            AsyncImage(url: URL(string: "https:\(hourlyForcast.condition?.icon ?? "")"))
                .scaledToFit()
                .frame(width: 30, height: 26)
            Spacer(minLength: 10)
            Text("\(hourlyForcast.tempC ?? 0, specifier: "%.0f")°")
                .font(.system(size: 22, weight: .regular , design: .default ))
                .foregroundStyle(.white)
            
        }
    }
}

//#Preview {
//    HourlyForcastListItem()
//}
