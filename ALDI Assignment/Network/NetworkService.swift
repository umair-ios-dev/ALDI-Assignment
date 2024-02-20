//
//  NetworkService.swift
//  ALDI Assignment
//
//  Created by umair on 19.02.24.
//

import Foundation

protocol NetworkService {
    var baseURL: URL { get }
    
    func fetchTopCryptos() async throws -> [Crypto]
    
    func fetchCrypto(by id: String) async throws -> Crypto
}

extension NetworkService {
    var baseURL: URL {
        URL(string: "https://api.coincap.io/v2/assets/")!
    }
}
