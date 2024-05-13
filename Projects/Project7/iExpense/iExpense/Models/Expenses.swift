//
//  Expenses.swift
//  iExpense
//
//  Created by Chintan Maisuriya on 12/05/24.
//

import Foundation
import SwiftUI


class Expenses: ObservableObject {
    private var expenseItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(expenseItems) {
                UserDefaults.standard.set(encoded, forKey: "Items")
                UserDefaults.standard.synchronize()
                getItems()
            }
        }
    }
    
    
    @Published var items = [ExpenseItem]()
    @Published var selectedExpenseType: ExpenseType = .business {
        didSet {
            getItems()
        }
    }

    init() {
        initialiseData()
    }
    
    // MARK: -
    
    private func initialiseData() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                expenseItems = decodedItems
                return
            }
        }

        expenseItems = []
    }
    
    private func getItems() {
        let arr = expenseItems.filter({ $0.type == selectedExpenseType })
        items = arr.sorted(by: { $0.createdAt > $1.createdAt })
    }
    
    func add(_ expense: ExpenseItem) {
        expenseItems.insert(expense, at: 0)
    }
    
    func removeItems(at offsets: IndexSet) {
        expenseItems.remove(atOffsets: offsets)
    }
}
