//
//  Utils.swift
//  ALDI Assignment
//
//  Created by umair on 19.02.24.
//

import Foundation
import SwiftUI

extension Double {
    // Function to abbreviate numbers (e.g., 1.5M for 1,500,000)
    func abbreviateNumber() -> String {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        numFormatter.maximumFractionDigits = 2
        
        let thousandNum = self / 1000
        let millionNum = self / 1000000
        let billionNum = self / 1000000000
        
        if billionNum >= 1.0 {
            return "\(numFormatter.string(from: NSNumber(value: billionNum)) ?? "")B"
        } else if millionNum >= 1.0 {
            return "\(numFormatter.string(from: NSNumber(value: millionNum)) ?? "")M"
        } else if thousandNum >= 1.0 {
            return "\(numFormatter.string(from: NSNumber(value: thousandNum)) ?? "")K"
        } else {
            return "\(numFormatter.string(from: NSNumber(value: self)) ?? "")"
        }
    }
}


struct BackgroundView: View {
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("TopColor"), Color("MidColor")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
    }
}

struct ImageLoader: View {
    
    let url: URL?
    let dimention: CGFloat
    private var cornerRadius: CGFloat {
        dimention/2
    }
    
    init(url: URL?, dimention: CGFloat = 56) {
        self.url = url
        self.dimention = dimention
    }
    
    var body: some View {
        AsyncImage(url: url) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: dimention, height: dimention)
        .cornerRadius(cornerRadius)
    }
}
