//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Chintan Maisuriya on 12/05/24.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var field: TextFieldType?

    @State private var name = ""
    @State private var amount = 0.0
    @State private var type             : ExpenseType = .personal
    @State private var currencyType     : Currency = .INR
    @State private var showErrorAlert   : Bool = false

    var expenses: Expenses

    // MARK: -
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .focused($field, equals: .name)

                Picker("Type", selection: $type) {
                    ForEach(ExpenseType.allCases, id: \.self) {
                        Text($0.description)
                    }
                }

                HStack {
                    Picker(currencyType.symbol, selection: $currencyType) {
                        ForEach(Currency.allCases, id: \.self) {
                            Text($0.symbol)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                    }
                    .labelsHidden()
                    
                    Spacer()
                    
                    TextField("Amount", value: $amount, format: .number.precision(.fractionLength(2)))
                        .keyboardType(.decimalPad)
                        .submitLabel(.done)
                        .focused($field, equals: .amount)
                    
                    Text(amount, format: .currency(code: currencyType.rawValue))
                        .foregroundColor(.gray)
                }
                
            }
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        add()
                    }
                    .alert("⚠️", isPresented: $showErrorAlert) {
                    } message: {
                        Text("Please fill all the details of expense")
                    }
                }
                
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        dismissKeyboard()
                    }
                }
            }
        }
    }
    
    // MARK: -
    
    private func add() {
        dismissKeyboard()
        
        guard (!name.isEmpty && amount > 0) else {
            showErrorAlert = true
            return
        }
        
        let item = ExpenseItem(name: name, type: type, currencyType: currencyType, amount: amount)
        expenses.add(item)
        dismiss()
    }
    
    private func dismissKeyboard() {
        field = nil
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenses: Expenses())
    }
}
