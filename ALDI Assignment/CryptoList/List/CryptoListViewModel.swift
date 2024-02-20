//
//  CryptoListViewModel.swift
//  ALDI Assignment
//
//  Created by umair on 19.02.24.
//

import Observation

@Observable class CryptoListViewModel {
    var cryptos: [Crypto] = []
    var isLoading: Bool = false
    private let networkManager: NetworkService
    
    init(networkManager: some NetworkService = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchTopCryptos() async {
        isLoading = true
        do {
            self.cryptos = try await networkManager.fetchTopCryptos()
        } catch {
            print("Error fetching top cryptos: \(error.localizedDescription)")
        }
        isLoading = false
    }
}
