//
//  NetworkManager.swift
//  ALDI Assignment
//
//  Created by umair on 20.02.24.
//

import Foundation

struct NetworkManager: NetworkService {
    
    static let assetsUrl: URL? = URL(string: "https://assets.coincap.io/assets/icons/")
    
    func fetchTopCryptos() async throws -> [Crypto] {
        let url = baseURL.appending(queryItems: [URLQueryItem(name: "limit", value: "10")]) // to get the top 10
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(CryptoList.self, from: data)
        return response.data
    }
    
    func fetchCrypto(by id: String) async throws -> Crypto {
        let url = baseURL.appendingPathComponent(id)
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let crypto = try decoder.decode(CryptoDetail.self, from: data)
        return crypto.data
    }
}
