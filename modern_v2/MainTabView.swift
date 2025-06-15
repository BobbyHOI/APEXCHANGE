//
//  MainTabView.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 21/04/2026.
//  Copyright © 2026 APEXCHANGE. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    init() {
        // Customize UITabBar appearance for modern dark look
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .black.withAlphaComponent(0.8)
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            MarketplaceView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Market")
                }
                .tag(1)
            
            WalletView()
                .tabItem {
                    Image(systemName: "wallet.pass.fill")
                    Text("Wallet")
                }
                .tag(2)
        }
        .accentColor(Theme.accent)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .preferredColorScheme(.dark)
    }
}
