//
//  HomeViewModel.swift
//  Ghyom
//
//  Created by Al3dwy on 03/06/2026.
//

import Foundation
import Observation

@Observable
@MainActor
class HomeViewModel {
    
    private let weatherRepo = WeatherRepo(storageService: SwiftDataWeatherService())
    
   
    var weather: CurrentWeatherResponse?
    var dayForecast: DayForecastResponse?
    var searchResults: [CitySearchResponse]?
    var isLoading = false
    var errorMessage: String?
    
    init() {
    }
    
    
        func addCityToFavorites(_ cityResponse: CitySearchResponse) {
            let newCity = SavedCity(city: cityResponse)
            do {
                try weatherRepo.saveCityToLocal(newCity)
            } catch {
                self.errorMessage = "Could not save \(cityResponse.name) to favorites."
            }
            print("Added \(cityResponse.name) to favorites")
        }
    
    
    func fetchWeather(latitude: Double, longitude: Double) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let currentWeatherResponse = try await weatherRepo.getCurrentWeather(latitude: latitude, longitude: longitude)
            let dayForecastResponse = try await weatherRepo.getDayForecast(latitude: latitude, longitude: longitude)
            self.weather = currentWeatherResponse
            self.dayForecast = dayForecastResponse
            isLoading = false
        } catch {
            self.errorMessage = error.localizedDescription
            isLoading = false
            print("Error: \(error.localizedDescription)")
        }
    }
    
    
    func getCitySearsh(cityName : String) async {
        isLoading = true
        errorMessage = nil
        do {
            let searchResponse = try await weatherRepo.getCitySearch(cityName: cityName)
            self.searchResults = searchResponse
            isLoading = false
        } catch {
            self.errorMessage = error.localizedDescription
            isLoading = false
            print("Error: \(error.localizedDescription)")
        }
    }

    
}
