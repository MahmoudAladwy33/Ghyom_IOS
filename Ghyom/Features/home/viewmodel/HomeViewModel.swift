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
    
    private let weatherRepo = WeatherRepo()
    
   
    var weather: CurrentWeatherResponse?
    var dayForecast: DayForecastResponse?
    var isLoading = false
    var errorMessage: String?
    
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
    
    
}
