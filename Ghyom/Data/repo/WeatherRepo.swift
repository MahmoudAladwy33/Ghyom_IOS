//
//  WeatherRepo.swift
//  Ghyom
//
//  Created by Al3dwy on 03/06/2026.
//

import Foundation

class WeatherRepo {
    
    private let shared = NetworkManager.shared
    
    func getCurrentWeather(latitude: Double, longitude: Double) async throws -> CurrentWeatherResponse {
            return try await shared.getCurrentWeather(latitude: latitude, longitude: longitude)
        }
}
