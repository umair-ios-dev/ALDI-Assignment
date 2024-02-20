//
//  CryptoDetailView.swift
//  ALDI Assignment
//
//  Created by umair on 19.02.24.
//

import SwiftUI

struct CryptoDetailView: View {
    let viewModel: CryptoDetailViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            if viewModel.isLoading { ProgressView() }
            VStack(spacing: 0) {
                createStackViews(nameLabel: viewModel.priceLabel, valueLabel: viewModel.priceValue)
                createStackViews(nameLabel: viewModel.percentageLabel, valueLabel: viewModel.percentageValue, setForegroundColor: viewModel.foregroundColor)
                Divider()
                    .background(.blue)
                    .padding([.top, .trailing, .leading], 14)
                createStackViews(nameLabel: viewModel.marketCapLabel, valueLabel: viewModel.marketCapValue)
                createStackViews(nameLabel: viewModel.marketVolumeLabel, valueLabel: viewModel.marketVolumeValue)
                createStackViews(nameLabel: viewModel.supplyLabel, valueLabel: viewModel.supplyValue)
                Spacer()
            }
            .background(Color.white.opacity(0.5))
            .cornerRadius(10)
            .padding(20)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    VStack {
                        ImageLoader(url: viewModel.imageURL, dimention: 40)
                    }
                }
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(viewModel.name)
                            .font(.custom("Poppins-Bold", size: 32))
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getCryptoDetail()
            }
        }
    }
    
    private func createStackViews(nameLabel: String, valueLabel: String, setForegroundColor: Color? = nil) -> some View {
        HStack{
            Text(nameLabel)
                .font(.custom("Poppins-Regular", size: 16))
                .foregroundColor(Color("TextColor"))
            Spacer()
            Text(valueLabel)
                .font(.custom("Poppins-Bold", size: 16))
                .foregroundColor(setForegroundColor)
        }
        .padding([.top, .trailing, .leading], 14)
    }
}
