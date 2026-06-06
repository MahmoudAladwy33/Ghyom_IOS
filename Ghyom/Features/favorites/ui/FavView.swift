//
//  FavView.swift
//  Ghyom
//

import SwiftUI

struct FavView: View {
    @State private var viewModel = FavViewModel()
    @Binding var selectedTab: Int
    @Binding var selectedCity: SavedCity?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.appBackgroundNight)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    if viewModel.savedCities.isEmpty {
                        ContentUnavailableView {
                            Label("No Favorites", systemImage: "star.slash")
                        } description: {
                            Text("You haven't added any cities to your favorites yet.")
                        }
                        .foregroundStyle(.white)
                    } else {
                        List {
                            ForEach(viewModel.savedCities) { city in
                                HStack {
                                    Text(city.name)
                                        .font(.title3)
                                        .bold()
                                        .foregroundStyle(.white)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical, 8)
                                .listRowBackground(Color.white.opacity(0.1))
                                .listRowSeparatorTint(.white.opacity(0.3))
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
                        .safeAreaPadding(.top, 60)
                    }
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear {
                viewModel.loadSavedCities()
            }
        }
    }
}

//#Preview {
//    FavView()
//}
