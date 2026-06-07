//
//  WeatherCard.swift
//  Ghyom
//
//  Created by Al3dwy on 31/05/2026.
//

import SwiftUI

struct WeatherCard<Content: View>: View {
    let title: String
    let icon: String
    let content: Content
    
    init(title: String, icon: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.icon = icon
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack(spacing: 6) {
                Image(systemName: icon)
                Text(title)
            }
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(.primary.opacity(0.5))
            
            
            content
        }
        .padding(14)
        .frame(maxWidth: .infinity, minHeight: 165, alignment: .topLeading)
        
        
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial.opacity(0.2))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.primary.opacity(0.15), lineWidth: 1)
        )
        .cornerRadius(16)
    }
}
//#Preview {
//    WeatherCard()
//}
