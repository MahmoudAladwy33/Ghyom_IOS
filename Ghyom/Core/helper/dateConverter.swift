//
//  dateConverter.swift
//  Ghyom
//
//  Created by Al3dwy on 05/06/2026.
//

import Foundation


func getDayName(from dateString: String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd"
    
    guard let date = inputFormatter.date(from: dateString) else {
        return dateString
    }
    
    if Calendar.current.isDateInToday(date) {
        return "Today"
    }
    
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "EEEE" 
    
    return outputFormatter.string(from: date)
}
