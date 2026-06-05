//
//  ContentView.swift
//  Ghyom
//
//  Created by Al3dwy on 28/05/2026.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            
            Image(.appBackgroundNight)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            

            if viewModel.isLoading {
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
                
            } else if let errorMessage = viewModel.errorMessage {
              
                VStack(spacing: 12) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.largeTitle)
                    Text("Error: \(errorMessage)")
                        .multilineTextAlignment(.center)
                }
                .foregroundColor(.red)
                .padding(.horizontal, 40)
                
            } else if viewModel.weather != nil && viewModel.dayForecast != nil {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 60) {
                        CurrentWeatherSummary(
                            cityName: viewModel.weather?.location?.name ?? "Unknown",
                            currentTemperature: viewModel.weather?.current?.tempC ?? 0.0,
                            weatherCondition: viewModel.weather?.current?.condition?.text ?? "Unknown",
                            highTemperature: viewModel.weather?.current?.feelslikeC ?? 0.0,
                            lowTemperature: viewModel.weather?.current?.feelslikeF ?? 0.0
                        )
                        WeatherDetailsGridView(
                            uvIndex: viewModel.weather?.current?.uv ?? 0.0,
                            humidity: viewModel.weather?.current?.humidity ?? 0,
                            windSpeed: viewModel.weather?.current?.windKph ?? 0.0,
                            visibility: viewModel.weather?.current?.visKM ?? 0.0,
                            pressure: viewModel.weather?.current?.pressureIn ?? 0.0
                        )
                        DaysForcast(
                            dayForecastList: viewModel.dayForecast?.forecast?.forecastday ?? []
                        )
                    }
                    .padding(.top, 20)
                }
            }
        }
        .task {
            await viewModel.fetchWeather(latitude: 30.0444, longitude: 31.2357)
        }
    }
}

//#Preview {
//    HomeView()
//}
