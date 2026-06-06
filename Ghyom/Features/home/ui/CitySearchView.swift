//
//  CitySearchView.swift
//  Ghyom
//
//  Created by Al3dwy on 06/06/2026.
//

import SwiftUI

struct CitySearchView: View {
    var viewModel: HomeViewModel
    @Binding var isPresented: Bool
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    Spacer()
                    ProgressView("Searching locations...")
                    Spacer()
                } else {
                    List(viewModel.searchResults ?? [], id: \.id) { result in
                        Button {
                            isPresented = false
                            viewModel.addCityToFavorites(result)
                        } label: {
                            HStack {
                                Text(result.name)
                                Spacer()
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Find Location")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a city...")
            .onChange(of: searchText) { _, newValue in
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
                    Button("Close") { isPresented = false }
                }
            }
        }
    }
}

//#Preview {
//    CitySearchView()
//}
