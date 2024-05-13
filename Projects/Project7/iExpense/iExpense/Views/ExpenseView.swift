//
//  ExpenseView.swift
//  iExpense
//
//  Created by Chintan Maisuriya on 13/05/24.
//

import SwiftUI

struct ExpenseView: View {
    
    // MARK: -
    
    var expenseItem: ExpenseItem

    // MARK: -

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(expenseItem.name)
                    .font(.title3)
                    .fontWeight(.medium)
                Text(expenseItem.type.description)
                    .font(.subheadline)
            }
            
            Spacer()
            Text(expenseItem.amount, format: .currency(code: expenseItem.currencyType.rawValue))
                .font(.title3)
                .fontWeight(.bold)
                .priceFormatter(with: expenseItem.amount)

        }
        .padding(.vertical, 4)
        .padding(.horizontal, 2)
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        let expense = ExpenseItem(name: "Shopping", type: .personal, currencyType: .INR, amount: 111)
        ExpenseView(expenseItem: expense)
    }
}
