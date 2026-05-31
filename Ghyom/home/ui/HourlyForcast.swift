//
//  HourlyForcast.swift
//  Ghyom
//
//  Created by Al3dwy on 28/05/2026.
//

import SwiftUI

struct HourlyForcast: View {
    var body: some View {
        
        VStack(spacing: 25){
            HStack{
                Text("Hourly Forecast")
                    .font(.system(size: 18, weight: .bold , design: .default , ))
                    .foregroundStyle(.white)
                Spacer()
            }.padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 22) {
                    ForEach(0..<10) { _ in
                        HourlyForcastListItem()
                    }
                }
                .padding(.horizontal, 20)
            }
            .frame(height: 130)
            
        }.padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.ultraThinMaterial.opacity(0.2))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.white.opacity(0.15), lineWidth: 1)
            )
            .padding(.horizontal, 8)
    }
}

#Preview {
    HourlyForcast()
}
