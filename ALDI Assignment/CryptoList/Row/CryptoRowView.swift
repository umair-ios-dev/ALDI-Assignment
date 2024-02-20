//
//  CryptoRowView.swift
//  ALDI Assignment
//
//  Created by umair on 19.02.24.
//

import SwiftUI

struct CryptoRowView: View {
    
    let viewModel: CryptoRowViewModel
    
    var body: some View {
        HStack {
            ImageLoader(url: viewModel.imageURL)
            .padding(.bottom)
            
            VStack(alignment: .leading) {
                Text(viewModel.crypto.name)
                    .font(.custom("Poppins-SemiBold", size: 20))
                Text(viewModel.crypto.symbol)
                    .font(.custom("Poppins-Regular", size: 16))
                    .padding(.bottom)
                    .foregroundColor(Color("TextColor"))
            }
            
            Spacer()
            
            VStack {
                Text(viewModel.price)
                    .font(.custom("Poppins-SemiBold", size: 16))
                Text(viewModel.changePercentage)
                    .font(.custom("Poppins-SemiBold", size: 16))
                    .foregroundColor(viewModel.foregroundColor)
                Image(systemName: viewModel.arrowIcon)
                    .resizable()
                    .frame(width: 16, height: 14)
            }
        }
        .padding(10)
    }
}

