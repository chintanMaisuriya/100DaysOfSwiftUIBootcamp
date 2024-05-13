//
//  Date+Extension.swift
//  iExpense
//
//  Created by Chintan Maisuriya on 13/05/24.
//

import Foundation

extension Date {
    static var currentTimeStamp: Int64{
        return Int64((Date().timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}
