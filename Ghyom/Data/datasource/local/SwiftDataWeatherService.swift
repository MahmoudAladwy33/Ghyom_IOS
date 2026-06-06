//
//  SwiftDataWeatherService.swift
//  Ghyom
//
//  Created by Al3dwy on 06/06/2026.
//

import Foundation
import SwiftData

protocol WeatherStorageServiceProtocol {
    func saveCity(_ city: SavedCity) throws
    func fetchSavedCities() throws -> [SavedCity]
    func deleteCity(_ city: SavedCity) throws
}

@MainActor
final class SwiftDataWeatherService: WeatherStorageServiceProtocol {
    
    private let container: ModelContainer
    private let context: ModelContext
    
    init() {
        do {
            self.container = try ModelContainer(for: SavedCity.self)
            self.context = container.mainContext
        } catch {
            fatalError("Failed to initialize SwiftData Container: \(error.localizedDescription)")
        }
    }
    
    func saveCity(_ city: SavedCity) throws {
        context.insert(city)
        try context.save()
    }
    
    func fetchSavedCities() throws -> [SavedCity] {
        let descriptor = FetchDescriptor<SavedCity>(sortBy: [SortDescriptor(\.createdAt, order: .reverse)])
        return try context.fetch(descriptor)
    }
    
    func deleteCity(_ city: SavedCity) throws {
        context.delete(city)
        try context.save()
    }
}
