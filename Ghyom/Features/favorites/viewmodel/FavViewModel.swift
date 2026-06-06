//
//  FavViewModel.swift
//  Ghyom
//

import Foundation
import Observation

@Observable
@MainActor
class FavViewModel {
    
    private let weatherRepo = WeatherRepo(storageService: SwiftDataWeatherService())
    
    var savedCities: [SavedCity] = []
    var errorMessage: String?
    
    init() {
        loadSavedCities()
    }
    
    func loadSavedCities() {
        do {
            self.savedCities = try weatherRepo.fetchLocalCities()
        } catch {
            self.errorMessage = "Failed to load saved cities: \(error.localizedDescription)"
        }
    }
    
    func removeCityFromFavorites(at offsets: IndexSet) {
        for index in offsets {
            let cityToDelete = savedCities[index]
            do {
                try weatherRepo.deleteLocalCity(cityToDelete)
            } catch {
                self.errorMessage = "Failed to delete city."
            }
        }
        loadSavedCities()
    }
}
