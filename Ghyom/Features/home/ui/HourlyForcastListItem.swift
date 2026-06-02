//
//  HourlyForcastListItem.swift
//  Ghyom
//
//  Created by Al3dwy on 28/05/2026.
//

import SwiftUI

struct HourlyForcastListItem: View {
    var body: some View {
        HStack(spacing: 15){
            Text("Now")
                .font(.system(size: 22, weight: .regular , design: .default , ))
                .foregroundStyle(.white)
            Spacer()
            Image(.weatherState)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 26)
            Spacer()
            Text("20°")
                .font(.system(size: 22, weight: .regular , design: .default , ))
                .foregroundStyle(.white)
            
        }
    }
}

#Preview {
    HourlyForcastListItem()
}
