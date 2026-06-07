//
//  FavView.swift
//  Ghyom
//

import SwiftUI

struct FavView: View {
    @State private var viewModel = FavViewModel()
    @Binding var selectedTab: Int
    @Binding var selectedCity: SavedCity?
    @Binding var isDay: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(isDay ? .appBackgroundMorning : .appBackgroundNight)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("Cities History")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.primary)
                        
                    }
                    .padding(.horizontal, 20)
                    .safeAreaPadding(.top, 75)
                    
                    if viewModel.savedCities.isEmpty {
                        ContentUnavailableView {
                            Label("No Favorites", systemImage: "star.slash")
                        } description: {
                            Text("You haven't added any cities to your favorites yet.")
                        }
                        .foregroundStyle(.primary)
                    } else {
                        List {
                            ForEach(viewModel.savedCities) { city in
                                HStack {
                                    Text(city.name)
                                        .font(.title3)
                                        .bold()
                                        .foregroundStyle(.primary)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.primary.opacity(0.5))
                                }
                                .padding(.vertical, 8)
                                .listRowBackground(Color.primary.opacity(0.1))
                                .listRowSeparatorTint(.primary.opacity(0.3))
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedCity = city
                                    selectedTab = 0
                                }
                            }
                            .onDelete(perform: viewModel.removeCityFromFavorites)
                        }
                        .scrollContentBackground(.hidden)
                        .listStyle(.plain)
                        .safeAreaPadding(.top, 20)
                    }
                }
            }
            .onAppear {
                viewModel.loadSavedCities()
            }
        }
    }
}

//#Preview {
//    FavView()
//}
