//
//  Crypto.swift
//  ALDI Assignment
//
//  Created by umair on 19.02.24.
//

import Foundation

struct Crypto: Decodable, Hashable, Identifiable {
    let id: String
    let name: String
    let symbol: String
    let priceUsd: String
    let changePercent24Hr: String
    let marketCapUsd: String
    let volumeUsd24Hr: String
    let supply: String
    
    var price: Double {
        return Double(priceUsd) ?? 0
    }
    
    var changePercentage: Double {
        return Double(changePercent24Hr) ?? 0
    }
    
    var supplyValue: Double {
        return Double(supply) ?? 0
    }
    
    var volume: Double {
        return Double(volumeUsd24Hr) ?? 0
    }
    
    var marketCap: Double {
        return Double(marketCapUsd) ?? 0
    }
}

struct CryptoList: Decodable {
    let data: [Crypto]
}

struct CryptoDetail: Decodable {
    let timestamp: Int
    let data: Crypto
}
