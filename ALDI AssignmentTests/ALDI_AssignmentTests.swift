//
//  ALDI_AssignmentTests.swift
//  ALDI AssignmentTests
//
//  Created by umair on 20.02.24.
//

import XCTest
@testable import ALDI_Assignment

class MockNetworkService: NetworkService {
    
    let mockCrypto = Crypto(id: "1", name: "Bitcoin", symbol: "BTC", priceUsd: "50000", changePercent24Hr: "5", marketCapUsd: "1000000000", volumeUsd24Hr: "5000000", supply: "20000000")
    
    func fetchCrypto(by id: String) async throws -> Crypto {
        mockCrypto
    }
    
    func fetchTopCryptos() async throws -> [Crypto] {
        return [mockCrypto]
    }
}

final class ALDI_AssignmentTests: XCTestCase {
    let mockCrypto = Crypto(id: "1", name: "Bitcoin", symbol: "BTC", priceUsd: "50000", changePercent24Hr: "5", marketCapUsd: "1000000000", volumeUsd24Hr: "5000000", supply: "20000000")
    // Mock NetworkService for testing
    
    
    func testFetchTopCryptos() async throws {
        let viewModel = CryptoListViewModel(networkManager: MockNetworkService())
        await viewModel.fetchTopCryptos()
        XCTAssertFalse(viewModel.cryptos.isEmpty) // Ensure cryptos are fetched successfully
    }
    
    func testFetchCrypto() async throws {
        let viewModel = CryptoListViewModel(networkManager: MockNetworkService())
        await viewModel.fetchTopCryptos()
        XCTAssertFalse(viewModel.cryptos.isEmpty) // Ensure cryptos are fetched successfully
    }
    
    // Test CryptoRowViewModel's computed properties
    func testCryptoRowViewModel() {
        
        let rowViewModel = CryptoRowViewModel(crypto: mockCrypto)
        XCTAssertEqual(rowViewModel.crypto.name, "Bitcoin")
        XCTAssertEqual(rowViewModel.crypto.symbol, "BTC")
        XCTAssertEqual(rowViewModel.price, "$50K") // Ensure price is correctly parsed
        XCTAssertEqual(rowViewModel.changePercentage, "5.00%") // Ensure change percentage is formatted correctly
        XCTAssertEqual(rowViewModel.foregroundColor, .green) // Ensure correct color for positive change
    }
    
    // Test CryptoListView's body rendering
    func testCryptoListViewBodyRendering() {
        let view = CryptoListView(viewModel: CryptoListViewModel(networkManager: MockNetworkService()))
        XCTAssertNoThrow(view.body)
    }
    
    
    // Test CryptoDetailViewModel's getCryptoDetail method
    func testGetCryptoDetail() async throws {
        let viewModel = CryptoDetailViewModel(crypto: mockCrypto, networkManager: MockNetworkService())
        await viewModel.getCryptoDetail()
        XCTAssertNotNil(viewModel.crypto) // Ensure crypto detail is fetched successfully
    }
    
    // Test CryptoDetailView's body rendering
    func testCryptoDetailViewBodyRendering() {
        let viewModel = CryptoDetailViewModel(crypto: mockCrypto, networkManager: MockNetworkService())
        let view = CryptoDetailView(viewModel: viewModel)
        XCTAssertNoThrow(view.body) // Ensure detail view initializes without errors
    }
    
    // Test CryptoDetailView's computed properties
    func testCryptoDetailViewComputedProperties() {
        let viewModel = CryptoDetailViewModel(crypto: mockCrypto, networkManager: MockNetworkService())
        
        XCTAssertEqual(viewModel.name, "Bitcoin")
        XCTAssertEqual(viewModel.priceLabel, "Price")
        XCTAssertEqual(viewModel.priceValue, "$50K")
        XCTAssertEqual(viewModel.percentageLabel, "Change (24h)")
        XCTAssertEqual(viewModel.percentageValue, "5.00%")
        XCTAssertEqual(viewModel.marketCapLabel, "Market Cap")
        XCTAssertEqual(viewModel.marketCapValue, "1B")
        XCTAssertEqual(viewModel.marketVolumeLabel, "Volume (24h)")
        XCTAssertEqual(viewModel.marketVolumeValue, "5M")
        XCTAssertEqual(viewModel.supplyLabel, "Supply")
        XCTAssertEqual(viewModel.supplyValue, "20M")
        XCTAssertEqual(viewModel.foregroundColor, .green)
        XCTAssertNotNil(viewModel.imageURL)
    }
}
