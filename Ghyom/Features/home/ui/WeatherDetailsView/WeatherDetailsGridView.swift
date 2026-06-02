//
//  WeatherDetailsGridView.swift
//  Ghyom
//
//  Created by Al3dwy on 31/05/2026.
//

import SwiftUI

struct WeatherDetailsGridView: View {
    let columns = [
        GridItem(.flexible() , spacing: 20),
        GridItem(.flexible()),
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            
            
            WeatherCard(title: "UV INDEX", icon: "sun.max.fill") {
                VStack(alignment: .leading, spacing: 4) {
                    Text("0").font(.system(size: 36, weight: .regular))
                    Text("Low").font(.system(size: 20, weight: .medium))
                    Spacer()
                    Text("Low for the rest of the day.").font(.system(size: 13))
                }
            }
            
            
            WeatherCard(title: "SUNRISE", icon: "sunrise.fill") {
                VStack(alignment: .leading, spacing: 2) {
                    HStack(alignment: .lastTextBaseline, spacing: 2) {
                        Text("6:28")
                            .font(.system(size: 32, weight: .light))
                        Text("AM")
                            .font(.system(size: 16, weight: .light))
                    }
                    Spacer()
                    Text("Sunset: 6:10PM").font(.system(size: 13))
                }
            }
            
           
            WeatherCard(title: "WIND", icon: "wind") {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .lastTextBaseline, spacing: 2) {
                        Text("1")
                            .font(.system(size: 36, weight: .regular))
                        Text(" m/s")
                            .font(.system(size: 20, weight: .regular))
                    }
                        Spacer()
                        Text("Light breeze from North.").font(.system(size: 13))
                    }
                }
                
                
                WeatherCard(title: "HUMIDITY", icon: "humidity") {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("73%").font(.system(size: 36, weight: .regular))
                        Spacer()
                        Text("The dew point is 16° right now.").font(.system(size: 13))
                    }
                }
                
               
                WeatherCard(title: "VISIBILITY", icon: "eye.fill") {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(alignment: .lastTextBaseline, spacing: 2) {
                            Text("10")
                                .font(.system(size: 36, weight: .regular))
                            Text(" km")
                                .font(.system(size: 20, weight: .regular))
                        }
                        Spacer()
                        Text("Perfectly clear view.").font(.system(size: 13))
                    }
                }
                
               
                WeatherCard(title: "PRESSURE", icon: "gauge.with.needle") {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("1013 hPa")
                            .font(.system(size: 34, weight: .regular))
                        Spacer()
                        Text("Typical sea level pressure.").font(.system(size: 13))
                    }
                }
            }
            .padding(.horizontal, 16)
            .foregroundColor(.white)
           
        }
    }

//#Preview {
//    WeatherDetailsGridView()
//}
