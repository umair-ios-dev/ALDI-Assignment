//
//  CryptoRowViewModel.swift
//  ALDI Assignment
//
//  Created by umair on 20.02.24.
//

import Foundation
import SwiftUI

struct CryptoRowViewModel {
    
    let crypto: Crypto
    
    var imageURL: URL? {
        NetworkManager.assetsUrl?.appendingPathComponent("\(crypto.symbol.lowercased())@2x.png")
    }
    
    var price: String {
        "$\(crypto.price.abbreviateNumber())"
    }
    
    var changePercentage : String {
        String(format: "%.2f%%", crypto.changePercentage)
    }
    
    var foregroundColor: Color {
        crypto.changePercentage >= 0 ? .green : .red
    }
    
    let arrowIcon: String = "arrow.right"
}
