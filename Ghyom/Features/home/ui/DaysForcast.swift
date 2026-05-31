//
//  DaysForcast.swift
//  Ghyom
//
//  Created by Al3dwy on 29/05/2026.
//

import SwiftUI

struct DaysForcast: View {
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Text("10-Day Forecast")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            
            LazyVStack(spacing: 22) {
                ForEach(0..<10) { _ in
                    DayForcastListItem()
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 16)
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
    DaysForcast()
}
