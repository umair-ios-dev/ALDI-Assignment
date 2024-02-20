//
//  ContentView.swift
//  ALDI Assignment
//
//  Created by umair on 20.02.24.
//

import SwiftUI

struct CryptoListView: View {
    var viewModel = CryptoListViewModel()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                BackgroundView()
                if viewModel.isLoading { ProgressView() }
                List(viewModel.cryptos) { crypto in
                    CryptoRowView(viewModel: CryptoRowViewModel(crypto: crypto))
                        .background(NavigationLink(value: crypto) {}.opacity(0)) // hack to hide default arrow
                        .listRowBackground(Color.white.opacity(0.5))
                }
                .listRowSpacing(10.0)
                .scrollContentBackground(.hidden)
                .navigationDestination(for: Crypto.self) { CryptoDetailView(viewModel: CryptoDetailViewModel(crypto: $0)) }
            }
            .navigationTitle("")
            .toolbarBackground(Color("TopColor"))
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    VStack {
                        Text("Coins")
                            .font(.custom("Poppins-Bold", size: 32))
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchTopCryptos()
            }
        }
    }
}

#Preview {
    CryptoListView()
}
