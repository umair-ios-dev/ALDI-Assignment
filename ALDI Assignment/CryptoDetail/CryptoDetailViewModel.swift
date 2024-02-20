//
//  CryptoDetailViewModel.swift
//  ALDI Assignment
//
//  Created by umair on 20.02.24.
//

import Observation
import Foundation
import SwiftUI

@Observable class CryptoDetailViewModel {
    
    var crypto: Crypto
    
    var isLoading: Bool = false
    
    private let networkManager: NetworkService
    
    var name: String {
        crypto.name
    }
    
    var priceLabel: String = "Price"
    
    var priceValue: String {
        "$\(crypto.price.abbreviateNumber())"
    }
    
    var percentageLabel: String = "Change (24h)"
    
    var percentageValue: String {
        String(format: "%.2f%%", crypto.changePercentage)
    }
    
    var marketCapLabel: String = "Market Cap"
    
    var marketCapValue: String {
        crypto.marketCap.abbreviateNumber()
    }
    
    var marketVolumeLabel: String = "Volume (24h)"
    
    var marketVolumeValue: String {
        crypto.volume.abbreviateNumber()
    }
    
    var supplyLabel: String = "Supply"
    
    var supplyValue: String {
        crypto.supplyValue.abbreviateNumber()
    }
    
    var foregroundColor: Color {
        crypto.changePercentage >= 0 ? .green : .red
    }
    
    var imageURL: URL? {
        NetworkManager.assetsUrl?.appendingPathComponent("\(crypto.symbol.lowercased())@2x.png")
    }
    
    init(crypto: Crypto, networkManager: some NetworkService = NetworkManager()) {
        self.crypto = crypto
        self.networkManager = networkManager
    }
    
    func getCryptoDetail() async {
        isLoading = true
        do {
            self.crypto = try await networkManager.fetchCrypto(by: crypto.id)
        } catch {
            print("Error fetching top cryptos: \(error.localizedDescription)")
        }
        isLoading = false
    }
}

