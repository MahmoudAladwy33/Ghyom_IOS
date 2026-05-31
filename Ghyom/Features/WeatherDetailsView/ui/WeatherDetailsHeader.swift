//
//  WeatherDetailsHeader.swift
//  Ghyom
//
//  Created by Al3dwy on 31/05/2026.
//

import SwiftUI

struct WeatherDetailsHeader: View {
    var body: some View {
        VStack{
            Text("SouthAfrica")
                .font(.system(size: 40, weight: .regular , design: .default , ))
                .tracking(3)
                .foregroundStyle(.white)
            
            Text("20° | Partly Cloudy")
                .font(.system(size: 22,  design: .default))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    WeatherDetailsHeader()
}
