//
//  WeatherDetailsGridView.swift
//  Ghyom
//
//  Created by Al3dwy on 31/05/2026.
//

import SwiftUI

struct WeatherDetailsGridView: View {
    var uvIndex : Double
    var humidity : Int
    var windSpeed : Double
    var visibility : Double
    var pressure : Double
    var sunrise : String
    var sunset : String
    
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
    
    
        
        var windDescription: String {
            switch windSpeed {
            case 0..<5.5:   return "Perfect weather for an outdoor walk."
            case 5.5..<10.8: return "Noticeable breeze. Tree leaves rustling."
            default:        return "Hold onto your hats! Strong gust risks."
            }
        }
        
        
        var humidityDescription: String {
            switch humidity {
            case 0..<30:   return "The air feels quite dry right now."
            case 30..<60:  return "Ideal, comfortable moisture level."
            default:       return "Moisture is making the air feel heavier."
            }
        }
        
        var visibilityDescription: String {
            switch visibility {
            case 0..<4:   return "Visibility severely reduced. Drive safely."
            case 4..<10:  return "Slight haze visible on the horizon."
            default:      return "Expect a perfectly clear, open view."
            }
        }
    
    var pressureDescription: String {
        if pressure > 1020 {
            return "High pressure system. Expect clear, calm conditions."
        } else if pressure < 1005 {
            return "Low pressure system. Clouds or precipitation possible."
        } else {
            return "Typical, stable sea-level atmosphere right now."
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
                        Text(sunrise)
                            .font(.system(size: 32, weight: .light))
                    }
                    Spacer()
                    Text("Sunset: \(sunset)").font(.system(size: 13))
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
                    Text(windDescription).font(.system(size: 13))
                }
            }
            
            
            WeatherCard(title: "HUMIDITY", icon: "humidity") {
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(humidity)%").font(.system(size: 36, weight: .regular))
                    Spacer()
                    Text(humidityDescription).font(.system(size: 13))
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
                    Text(visibilityDescription).font(.system(size: 13))
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
        .foregroundColor(.primary)
        
    }
}

//#Preview {
//    WeatherDetailsGridView()
//}
