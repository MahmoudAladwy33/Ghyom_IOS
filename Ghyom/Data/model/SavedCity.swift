//
//  SavedCity.swift
//  Ghyom
//
//  Created by Al3dwy on 06/06/2026.
//

import Foundation
import SwiftData

@Model
final class SavedCity {
    @Attribute(.unique) var id: Int
    var name: String
    var region: String
    var country: String
    var latitude: Double
    var longitude: Double
    var createdAt: Date
    
    init(city : CitySearchResponse, createdAt: Date = .now) {
        self.id = city.id
        self.name = city.name
        self.region = city.region
        self.country = city.country
        self.latitude = city.lat
        self.longitude = city.lon
        self.createdAt = createdAt
    }
}
