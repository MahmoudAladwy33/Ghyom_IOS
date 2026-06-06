//
//  citySearch.swift
//  Ghyom
//
//  Created by Al3dwy on 05/06/2026.
//

import Foundation

struct CitySearchResponse: Decodable {
    let id: Int
    let name, region, country: String
    let lat, lon: Double
    let url: String
}
