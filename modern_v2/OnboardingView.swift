//
//  OnboardingView.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 21/04/2026.
//  Copyright © 2026 APEXCHANGE. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    @State private var showLogin = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Theme.background.ignoresSafeArea()
                
                VStack(spacing: 60) {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Image("APEXCHANGE logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding(.bottom, 10)
                            
                        Text("APEXCHANGE")
                            .font(.system(size: 40, weight: .light))
                            .tracking(8)
                            .foregroundColor(Theme.primaryText)
                        
                        Theme.smallCaps("Global Currency Protocol")
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 16) {
                        NavigationLink(destination: MainTabView()) {
                            HStack {
                                Spacer()
                                Text("Get Started")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.vertical, 18)
                            .background(Theme.primaryText)
                            .clipShape(Capsule())
                        }
                        
                        Button(action: { showLogin.toggle() }) {
                            Text("Sign In")
                                .font(.system(size: 14))
                                .foregroundColor(Theme.secondaryText)
                        }
                    }
                    .padding(24)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
