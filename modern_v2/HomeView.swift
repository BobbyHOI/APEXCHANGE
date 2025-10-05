//
//  HomeView.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 21/04/2026.
//  Copyright © 2026 APEXCHANGE. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Theme.background.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        // Header
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image("APEXCHANGE. app logo whitepng")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 32)
                                Spacer()
                                Image(systemName: "bell.badge")
                                    .foregroundColor(Theme.primaryText)
                                    .font(.system(size: 20))
                            }
                            .padding(.bottom, 16)
                            
                            Theme.smallCaps("Available Balance")
                            Text("$124,500.00")
                                .font(.system(size: 44, weight: .light))
                                .foregroundColor(Theme.primaryText)
                        }
                        .padding(.top, 20)
                        
                        // Quick Actions
                        HStack(spacing: 16) {
                            NavigationLink(destination: TransferView()) {
                                Text("Transfer")
                                    .font(.system(size: 14))
                                    .luxuryPill()
                            }
                            
                            NavigationLink(destination: MarketplaceView()) {
                                Text("Market")
                                    .font(.system(size: 14))
                                    .luxuryPill()
                            }
                            
                            NavigationLink(destination: ExchangeView()) {
                                Text("Exchange")
                                    .font(.system(size: 14))
                                    .luxuryPill()
                            }
                        }
                        
                        // Recent Activity
                        VStack(alignment: .leading, spacing: 20) {
                            Theme.smallCaps("Recent Activity")
                            
                            ForEach(0..<5) { _ in
                                ActivityRow()
                                Divider().background(Theme.line)
                            }
                        }
                    }
                    .padding(24)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ActivityRow: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("USD to NGN")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Theme.primaryText)
                Text("Oct 24, 2024")
                    .font(.system(size: 12))
                    .foregroundColor(Theme.secondaryText)
            }
            Spacer()
            Text("+$450.00")
                .font(.system(size: 16, weight: .light))
                .foregroundColor(Theme.primaryText)
        }
        .padding(.vertical, 8)
    }
}
