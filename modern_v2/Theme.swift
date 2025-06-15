//
//  Theme.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 21/04/2026.
//  Copyright © 2026 APEXCHANGE. All rights reserved.
//

import SwiftUI

enum Theme {
    static let background = Color.black
    static let primaryText = Color.white
    static let secondaryText = Color.white.opacity(0.6)
    static let accent = Color(red: 0.35, green: 0.3, blue: 0.9) // Indigo Luxury
    static let line = Color.white.opacity(0.2)
    
    static func smallCaps(_ text: String) -> some View {
        Text(text.uppercased())
            .font(.system(size: 11, weight: .medium))
            .tracking(0.5)
            .foregroundColor(secondaryText)
    }
}

struct LuxuryPill: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .stroke(Theme.line, lineWidth: 1)
            )
    }
}

extension View {
    func luxuryPill() -> some View {
        self.modifier(LuxuryPill())
    }
}
