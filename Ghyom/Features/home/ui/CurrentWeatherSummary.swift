//
//  CurrentWeatherSummary.swift
//  Ghyom
//
//  Created by Al3dwy on 28/05/2026.
//

import SwiftUI

struct CurrentWeatherSummary: View {
    var body: some View {
        VStack(spacing: 5) {
            Text("SouthAfrica")
                .font(.system(size: 40, weight: .regular , design: .default , ))
                .tracking(3)
                .foregroundStyle(.white)
               
              
            Text("20°")
                .font(.system(size: 102,weight: .thin ,  design: .default))
                .foregroundStyle(.white)
            
            Text("Partly Cloudy")
                .font(.system(size: 24, weight: .regular , design: .default))
                .foregroundStyle(.white)
            
            Text("H: 25°    L: 18°")
                .font(.system(size: 21, weight: .regular , design: .default))
                .foregroundStyle(.white)
        }.padding(.top , 80)
    }
}

#Preview {
    CurrentWeatherSummary()
}
