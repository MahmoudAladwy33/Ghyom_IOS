//
//  WeatherRepo.swift
//  Ghyom
//
//  Created by Al3dwy on 03/06/2026.
//

import Foundation

class WeatherRepo {
    
    private let shared = NetworkManager.shared
    private let storageService: WeatherStorageServiceProtocol
    
    init(storageService: WeatherStorageServiceProtocol) {
            self.storageService = storageService
        }
    
    func getCurrentWeather(latitude: Double, longitude: Double) async throws -> CurrentWeatherResponse {
            return try await shared.getCurrentWeather(latitude: latitude, longitude: longitude)
        }
    
    func getDayForecast(latitude: Double, longitude: Double) async throws -> DayForecastResponse {
        return try await shared.getDayForecast(latitude: latitude, longitude: longitude)
    }
    
    
    func getCitySearch(cityName: String) async throws -> [CitySearchResponse]{
        return try await shared.getCitySearch(cityName: cityName)
    }
    
    func saveCityToLocal(_ city: SavedCity) throws {
            try storageService.saveCity(city)
        }
        
        func fetchLocalCities() throws -> [SavedCity] {
            return try storageService.fetchSavedCities()
        }
        
        func deleteLocalCity(_ city: SavedCity) throws {
            try storageService.deleteCity(city)
        }
}
