//
//  ExpenseType.swift
//  iExpense
//
//  Created by Chintan Maisuriya on 13/05/24.
//

import Foundation

enum ExpenseType: Int, Codable, CaseIterable {
    case business
    case personal
    
    var description: String {
        switch self {
        case .business : return "Business"
        case .personal : return "Personal"
        }
    }
}
