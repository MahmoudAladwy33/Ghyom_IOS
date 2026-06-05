//
//  WeatherDetailsGridView.swift
//  Ghyom
//
//  Created by Al3dwy on 31/05/2026.
//

import SwiftUI

struct WeatherDetailsGridView: View {
    @State var uvIndex : Double
    @State var humidity : Int
    @State var windSpeed : Double
    @State var visibility : Double
    @State var pressure : Double
    let columns = [
        GridItem(.flexible() , spacing: 20),
        GridItem(.flexible()),
    ]
    
    
    var uvCategory: String {
        switch uvIndex {
        case 0..<3:   return "Low"
        case 3..<6:   return "Moderate"
        case 6..<8:   return "High"
        case 8..<11:  return "Very High"
        default:      return "Extreme"
        }
    }

   
    var uvDescription: String {
        switch uvIndex {
        case 0..<3:   return "Low for the rest of the day."
        case 3..<6:   return "Take precautions during midday hours."
        case 6..<8:   return "Protection needed. Seek shade around midday."
        case 8..<11:  return "Extra protection required. Avoid sun exposure."
        default:      return "Extreme risk. Minimize outdoor time."
        }
    }
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            
            
            WeatherCard(title: "UV INDEX", icon: "sun.max.fill") {
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(uvIndex, specifier: "%.1f")").font(.system(size: 36, weight: .regular))
                    
                    Text(uvCategory).font(.system(size: 20, weight: .medium))
                    Spacer()
                    Text(uvDescription).font(.system(size: 13))
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
                        Text("\(windSpeed , specifier: "%.1f")")
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
                        Text("\(humidity)%").font(.system(size: 36, weight: .regular))
                        Spacer()
                        Text("The dew point is 16° right now.").font(.system(size: 13))
                    }
                }
                
               
                WeatherCard(title: "VISIBILITY", icon: "eye.fill") {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(alignment: .lastTextBaseline, spacing: 2) {
                            Text("\(visibility, specifier: "%.1f")")
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
                        Text("\(pressure, specifier: "%.1f") inHg")
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
