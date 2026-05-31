//
//  DayForcastListItem.swift
//  Ghyom
//
//  Created by Al3dwy on 29/05/2026.
//

import SwiftUI

struct DayForcastListItem: View {
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
                Spacer()
                Text("20°")
                    .font(.system(size: 22, weight: .regular , design: .default , ))
                    .foregroundStyle(.white)
            }
        } .padding(.horizontal, 20)
    }
}

#Preview {
    DayForcastListItem()
}
