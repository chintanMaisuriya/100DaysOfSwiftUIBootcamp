//
//  PriceModifier.swift
//  iExpense
//
//  Created by Chintan Maisuriya on 13/05/24.
//

import SwiftUI

struct PriceModifier: ViewModifier {
    var amount: Double
    
    private var color: Color {
        if amount < 10 {
            return .green
        } else if amount < 100 {
            return .blue
        } else {
            return .red
        }
    }
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
    }
    
}

extension View {
    func priceFormatter(with amount: Double) -> some View {
        modifier(PriceModifier(amount: amount))
    }
}
