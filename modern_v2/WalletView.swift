//
//  WalletView.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 21/04/2026.
//  Copyright © 2026 APEXCHANGE. All rights reserved.
//

import SwiftUI
struct WalletView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Your Wallet")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                CardView(title: "Main Account", balance: "5,240.50 USD")
                
                Text("Balances")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                BalanceRow(currency: "NGN", amount: "250,000.00")
                BalanceRow(currency: "EUR", amount: "1,200.00")
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
    }
}

struct CardView: View {
    let title: String
    let balance: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.caption).foregroundColor(.white.opacity(0.6))
            Text(balance).font(.system(size: 32, weight: .bold)).foregroundColor(.white)
        }
        .padding(30)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(LinearGradient(colors: [.indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
    }
}

struct BalanceRow: View {
    let currency: String
    let amount: String
    
    var body: some View {
        HStack {
            Text(currency).font(.headline).foregroundColor(.white)
            Spacer()
            Text(amount).font(.body).foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}
