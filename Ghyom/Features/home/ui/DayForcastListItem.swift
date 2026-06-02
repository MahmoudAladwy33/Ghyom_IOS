//
//  DayForcastListItem.swift
//  Ghyom
//
//  Created by Al3dwy on 29/05/2026.
//

import SwiftUI

struct DayForcastListItem: View {
    @State private var showSheet = false
    var body: some View {
        VStack{
            HStack{
                Text("Today")
                    .font(.system(size: 22, weight: .regular , design: .default , ))
                    .foregroundStyle(.white)
                    .padding(.trailing , 20)
                
                Image(.weatherState)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 26)
                Text("20°")
                    .font(.system(size: 22, weight: .regular , design: .default , ))
                    .foregroundStyle(.gray)
                    .padding(.leading , 8 )
                
                TemperatureRangeBar(minTemp: 15, maxTemp: 29, currentTemp: 21)
                
                Text("20°")
                    .font(.system(size: 22, weight: .regular , design: .default , ))
                    .foregroundStyle(.white)
                    .padding(.leading , 8 )
            }
            .onTapGesture {
                showSheet = true
            }
            .sheet(isPresented: $showSheet) {
                HourlyForcast()
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
                    .presentationBackground {
                        Image(.hourlyForcastBackground)
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                    }
            }
        } .padding(.horizontal, 20)
    }
}

#Preview {
    DayForcastListItem()
}
