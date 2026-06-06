//
//  ContentView.swift
//  Ghyom
//
//  Created by Al3dwy on 28/05/2026.
//

import SwiftUI
import CoreLocation
struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    @State private var locationManager = LocationManager()
    @State private var isPresentedSearch = false
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            Image(.appBackgroundNight)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            
            if locationManager.authorizationStatus == .denied || locationManager.authorizationStatus == .restricted {
                
                ContentUnavailableView {
                    Label("Location Access Required", systemImage: "location.slash")
                } description: {
                    Text("Ghyom needs location services enabled in Settings to fetch your local weather data.")
                } actions: {
                    Button(action: openAppSettings) {
                        Text("Open Settings")
                            .font(.headline)
                            .bold()
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                }
                .foregroundStyle(.white)
                
            } else if viewModel.isLoading || locationManager.location == nil {
                
                
                VStack(spacing: 15) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.5)
                    
                    if locationManager.location == nil {
                        Text("Locating your device...")
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.7))
                    }
                }
                
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
                            pressure: viewModel.weather?.current?.pressureIn ?? 0.0,
                            sunrise: viewModel.dayForecast?.forecast?.forecastday.first?.astro.sunrise ?? "Unknown",
                            sunset: viewModel.dayForecast?.forecast?.forecastday.first?.astro.sunset ?? "Unknown"
                        )
                        DaysForcast(
                            dayForecastList: viewModel.dayForecast?.forecast?.forecastday ?? []
                        )
                    }
                    .padding(.top, 20)
                }
                .refreshable {
                    
                    if let location = locationManager.location {
                        await viewModel.fetchWeather(latitude: location.latitude, longitude: location.longitude)
                    }
                }
            }
        }
        .overlay(alignment: .topLeading) {
                    if viewModel.weather != nil {
                        Button {
                            isPresentedSearch.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .padding(12)
                                
                        }
                        .padding(.trailing, 20)
                        .padding(.top, 60)
                    }
                }
                .sheet(isPresented: $isPresentedSearch) {
                    NavigationStack {
                        VStack {
                            if viewModel.isLoading {
                                Spacer()
                                ProgressView("Searching locations...")
                                Spacer()
                            } else {
                                List(viewModel.searchResults ?? [], id: \.id) { result in
                                    Text(result.name)
                                }
                                .listStyle(.plain)
                            }
                        }
                        .navigationTitle("Find Location")
                        .navigationBarTitleDisplayMode(.inline)
                        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a city...")
                        .onChange(of: searchText) { oldValue, newValue in
                            let cleanedQuery = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
                            
                            guard !cleanedQuery.isEmpty else {
                                viewModel.searchResults = nil
                                return
                            }
                            
                            Task {
                                try? await Task.sleep(for: .seconds(0.5))
                                if searchText == newValue {
                                    await viewModel.getCitySearsh(cityName: cleanedQuery)
                                }
                            }
                        }
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button("Close") { isPresentedSearch = false }
                            }
                        }
                    }
                    .presentationDetents([.medium, .large])
                }
        .task {
            locationManager.startUpdatingLocation()
            while locationManager.location == nil {
                try? await Task.sleep(for: .seconds(0.2))
            }
            
            if let location = locationManager.location {
                await viewModel.fetchWeather(latitude: location.latitude, longitude: location.longitude)
            }
        }
        
        
    }
}
//#Preview {
//    HomeView()
//}
