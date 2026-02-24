//
//  TransferView.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 21/04/2026.
//  Copyright © 2026 APEXCHANGE. All rights reserved.
//

import SwiftUI

struct TransferView: View {
    @State private var amount = ""
    @State private var recipient = ""
    
    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 40) {
                Text("Send Money")
                    .font(.system(size: 32, weight: .light))
                    .foregroundColor(Theme.primaryText)
                
                VStack(alignment: .leading, spacing: 12) {
                    Theme.smallCaps("Recipient")
                    TextField("Username or Email", text: $recipient)
                        .font(.system(size: 18, weight: .light))
                        .padding(.vertical, 12)
                        .overlay(Rectangle().frame(height: 1).padding(.top, 45).foregroundColor(Theme.line), alignment: .top)
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Theme.smallCaps("Amount")
                    HStack {
                        Text("$")
                            .font(.system(size: 24, weight: .light))
                        TextField("0.00", text: $amount)
                            .font(.system(size: 44, weight: .light))
                            .keyboardType(.decimalPad)
                    }
                }
                
                Spacer()
                
                Button(action: {}) {
                    HStack {
                        Spacer()
                        Text("Confirm Transfer")
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
