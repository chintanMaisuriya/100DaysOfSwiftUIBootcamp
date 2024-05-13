//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Chintan Maisuriya on 12/05/24.
//

import Foundation

struct ExpenseItem: Codable, Identifiable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let currencyType: Currency
    let amount: Double
    var createdAt = Date.currentTimeStamp
}
