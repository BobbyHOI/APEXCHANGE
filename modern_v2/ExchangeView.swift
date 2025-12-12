//
//  ExchangeView.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 21/04/2026.
//  Copyright © 2026 APEXCHANGE. All rights reserved.
//

import SwiftUI

struct ExchangeView: View {
    @State private var fromAmount: String = "1.00"
    @State private var toAmount: String = "450.00"
    
    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 32) {
                Text("Global Swap")
                    .font(.system(size: 32, weight: .light))
                    .foregroundColor(Theme.primaryText)
                
                VStack(spacing: 0) {
                    CurrencyInput(label: "From", currency: "USD", amount: $fromAmount)
                    
                    // Swap Icon
                    HStack {
                        Spacer()
                        Image(systemName: "arrow.up.arrow.down")
                            .font(.system(size: 16))
                            .foregroundColor(Theme.secondaryText)
                            .padding(12)
                            .background(Theme.background)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Theme.line, lineWidth: 1))
                        Spacer()
                    }
                    .padding(.vertical, -16)
                    .zIndex(1)
                    
                    CurrencyInput(label: "To", currency: "NGN", amount: $toAmount)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Theme.smallCaps("Exchange Rate")
                    Text("1 USD = 450.00 NGN")
                        .font(.system(size: 14))
                        .foregroundColor(Theme.secondaryText)
                }
                
                Spacer()
                
                Button(action: {}) {
                    HStack {
                        Spacer()
                        Text("Confirm Swap")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.vertical, 18)
                    .background(Theme.primaryText)
                    .clipShape(Capsule())
                }
            }
            .padding(24)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CurrencyInput: View {
    let label: String
    let currency: String
    @Binding var amount: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Theme.smallCaps(label)
            HStack {
                Text(currency)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Theme.primaryText)
                Spacer()
                TextField("0.00", text: $amount)
                    .font(.system(size: 24, weight: .light))
                    .multilineTextAlignment(.right)
                    .keyboardType(.decimalPad)
            }
            .padding(20)
            .background(RoundedRectangle(cornerRadius: 16).stroke(Theme.line, lineWidth: 1))
        }
    }
}
