//
//  MarketplaceView.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 21/04/2026.
//  Copyright © 2026 APEXCHANGE. All rights reserved.
//

import SwiftUI

struct MarketplaceView: View {
    @State private var searchText = ""
    
    let activeDeals = [
        Deal(fromCurrency: "USD", toCurrency: "NGN", amount: "1,500.00", rate: "460.50"),
        Deal(fromCurrency: "EUR", toCurrency: "NGN", amount: "2,200.00", rate: "510.20"),
        Deal(fromCurrency: "GBP", toCurrency: "NGN", amount: "800.00", rate: "585.00"),
        Deal(fromCurrency: "USD", toCurrency: "EUR", amount: "5,000.00", rate: "0.92")
    ]
    
    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                // Header
                HStack {
                    Text("Marketplace")
                        .font(.system(size: 32, weight: .light))
                        .foregroundColor(Theme.primaryText)
                    Spacer()
                    Image(systemName: "plus.circle")
                        .font(.title2)
                        .foregroundColor(Theme.secondaryText)
                }
                .padding(.horizontal, 24)
                .padding(.top, 20)
                
                // Active Deals List
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(activeDeals) { deal in
                            DealCard(deal: deal)
                        }
                    }
                    .padding(24)
                }
            }
        }
    }
}

struct Deal: Identifiable {
    let id = UUID()
    let fromCurrency: String
    let toCurrency: String
    let amount: String
    let rate: String
}

struct DealCard: View {
    let deal: Deal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Theme.smallCaps("Trading Pair")
                    Text("\(deal.fromCurrency) → \(deal.toCurrency)")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Theme.primaryText)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 4) {
                    Theme.smallCaps("Rate")
                    Text(deal.rate)
                        .font(.system(size: 18, weight: .light))
                        .foregroundColor(Theme.primaryText)
                }
            }
            
            Divider().background(Theme.line)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Theme.smallCaps("Available Amount")
                    Text("\(deal.fromCurrency) \(deal.amount)")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Theme.primaryText)
                }
                Spacer()
                Button(action: {}) {
                    Text("Place Bid")
                        .font(.system(size: 12, weight: .bold))
                        .luxuryPill()
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Theme.line, lineWidth: 1)
        )
    }
}

struct MarketplaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceView()
            .preferredColorScheme(.dark)
    }
}
