//
//  CurrentWeatherSummary.swift
//  Ghyom
//
//  Created by Al3dwy on 28/05/2026.
//

import SwiftUI

struct CurrentWeatherSummary: View {
    @State var cityName : String
    @State var currentTemperature : Double
    @State var weatherCondition : String
    @State var highTemperature : Double
    @State var lowTemperature : Double
    var body: some View {
        VStack(spacing: 5) {
            Text(cityName)
                .font(.system(size: 40, weight: .regular , design: .default , ))
                .tracking(3)
                .foregroundStyle(.primary)
               
              
            Text("\(Int(currentTemperature))°")
                .font(.system(size: 102,weight: .thin ,  design: .default))
                .foregroundStyle(.primary)
            
            Text(weatherCondition)
                .font(.system(size: 24, weight: .regular , design: .default))
                .foregroundStyle(.primary)
            
            Text("H: \(Int(highTemperature))°      L: \(Int(lowTemperature))°")
                .font(.system(size: 21, weight: .regular , design: .default))
                .foregroundStyle(.primary)
        }.padding(.top , 80)
    }
}

//#Preview {
//    CurrentWeatherSummary()
//}
