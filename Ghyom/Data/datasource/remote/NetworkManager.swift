//
//  NetworkManager.swift
//  Ghyom
//
//  Created by Al3dwy on 02/06/2026.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.weatherapi.com/v1"
    private let apiKey = "2b2f60d39bae4ab58b6111940260306"
    private init() {}
    
    func getCurrentWeather(latitude: Double, longitude: Double) async throws -> CurrentWeatherResponse {
        
        let url = baseURL + ApiEndpoint.currentWeather.rawValue
        let parameters: [String: String] = [
            "key": apiKey,
            "q": "\(30.0444),\(31.2357)",
            "lang": "en",
            "aqi": "no"
        ]
        
        let data = try await AF.request(url, method: .get, parameters: parameters)
                                   .serializingData()
                                   .value
            let response = try JSONDecoder().decode(CurrentWeatherResponse.self, from: data)
            print("NetworkManager: Successfully fetched current weather data. , Response: \(response)")
            return response
    }
    
    
    func getDayForecast(latitude: Double, longitude: Double) async throws -> DayForecastResponse {
        
        let url = baseURL + ApiEndpoint.dayForecast.rawValue
        let parameters: [String: String] = [
            "key": apiKey,
            "q": "\(30.0444),\(31.2357)",
            "days": "10",
            "lang": "en",
            "aqi": "no"
        ]
        
        let data = try await AF.request(url, method: .get, parameters: parameters)
                                   .serializingData()
                                   .value
            let response = try JSONDecoder().decode(DayForecastResponse.self, from: data)
            print("NetworkManager: Successfully fetched current weather data. , Response: \(response)")
            return response
    }
    
    
    
}
