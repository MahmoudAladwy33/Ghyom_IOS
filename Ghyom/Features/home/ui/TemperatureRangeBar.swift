//
//  TemperatureRangeBar.swift
//  Ghyom
//
//  Created by Al3dwy on 02/06/2026.
//

import SwiftUI

struct TemperatureRangeBar: View {
    let minTemp: Double
    let maxTemp: Double
    let currentTemp: Double
    
   
    let rangeGradient = LinearGradient(
        colors: [.green, .yellow, .orange],
        startPoint: .leading,
        endPoint: .trailing
    )
    
    var body: some View {
        GeometryReader { geometry in
          
            let totalRange = maxTemp - minTemp
            let currentOffset = currentTemp - minTemp
            let percentage = totalRange > 0 ? (currentOffset / totalRange) : 0.0
            
           
            let validPercentage = min(max(percentage, 0.0), 1.0)
            let dotPosition = CGFloat(validPercentage) * geometry.size.width
            
            ZStack(alignment: .leading) {
             
                Capsule()
                    .fill(Color(.systemGray5))
                    .frame(height: 6)
                
             
                Capsule()
                    .fill(rangeGradient)
                    .frame(height: 6)
                
               
                Circle()
                    .fill(.white)
                    .frame(width: 6, height: 6)
                   
                    .overlay(Circle().stroke(Color.black.opacity(0.3), lineWidth: 1))
                    .offset(x: dotPosition - 3)
            }
            .frame(maxHeight: .infinity, alignment: .center)
        }
        .frame(width: 80, height: 20) 
    }
}
