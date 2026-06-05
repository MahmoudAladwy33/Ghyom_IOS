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
    var isLoading = false
    var errorMessage: String?
    
    func fetchCurrentWeather(latitude: Double, longitude: Double) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await weatherRepo.getCurrentWeather(latitude: latitude, longitude: longitude)
            self.weather = response
            isLoading = false
        } catch {
            self.errorMessage = error.localizedDescription
            isLoading = false
            print("Error: \(error.localizedDescription)")
        }
    }
}
