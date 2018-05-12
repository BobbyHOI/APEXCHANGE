//
//  OnboardingPage.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 21/09/2017.
//  Copyright © 2017 APEXCHANGE. All rights reserved.
//

import SwiftUI

struct OnboardingPage: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("onboarding_illustration")
                .resizable()
                .scaledToFit()
                .frame(height: 250)
            
            VStack(spacing: 15) {
                Text("Send Money Around The World")
                    .font(.custom("Inter-Bold", size: 28))
                    .foregroundColor(Color("BlueColor"))
                    .multilineTextAlignment(.center)
                
                Text("APEXCHANGE: Send money to your loved ones at a cheaper rate.")
                    .font(.custom("Inter-Regular", size: 16))
                    .foregroundColor(Color("GreyColor"))
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            Button(action: {
                // Navigate to signup
            }) {
                Text("Get Started")
                    .font(.custom("Inter-Bold", size: 18))
                    .foregroundColor(.white)
                    .frame(width: 300, height: 60)
                    .background(Color("BlueColor"))
                    .cornerRadius(10)
            }
            .padding(.bottom, 50)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}
