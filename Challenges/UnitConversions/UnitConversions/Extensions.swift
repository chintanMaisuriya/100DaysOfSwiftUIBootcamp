//
//  Extensions.swift
//  UnitConversions
//
//  Created by Chintan Maisuriya on 21/04/23.
//

import Foundation

//MARK: - Extension: UnitDuration

extension UnitDuration {
    
    static let SecondsPerDay: Double = 86_400
    
    static let days   = UnitDuration("days", coefficient: SecondsPerDay)
    static let weeks  = UnitDuration("weeks", coefficient: SecondsPerDay * 7)
    static let months = UnitDuration("months", coefficient: SecondsPerDay * 30.417)
    static let years  = UnitDuration("years", coefficient: SecondsPerDay * 365)
    
    convenience init (_ symbol: String, coefficient: Double) {
        self.init(symbol: symbol, converter: UnitConverterLinear(coefficient: coefficient))
    }
}
