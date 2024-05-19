//
//  ContentView.swift
//  iExpense
//
//  Created by Chintan Maisuriya on 10/05/24.
//

import SwiftUI

// MARK: - DisplayNewview: Using Sheet
/*
struct ContentView: View {
    @StateObject private var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var selectedExpenseType: ExpenseType = .business

    var body: some View {
        NavigationStack {
           
            VStack(spacing: 28, content: {
                Picker("Type", selection: $selectedExpenseType) {
                    ForEach(ExpenseType.allCases, id: \.self) {
                        Text($0.description)
                    }
                }
                .padding(.horizontal, 12)
                .pickerStyle(.segmented)
                .onChange(of: selectedExpenseType) { newValue in
                    expenses.selectedExpenseType = newValue
                }

                List {
                    ForEach(expenses.items, id: \.id) { item in
                        ExpenseView(expenseItem: item)
                    }
                    .onDelete(perform: removeItems)
                }
            })
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddExpenseView(expenses: expenses)
        }
    }
    
    // MARK: -
    
    private func removeItems(at offsets: IndexSet) {
        expenses.removeItems(at: offsets)
    }
}
*/


// MARK: - DisplayNewview: NavigationLink

struct ContentView: View {
    @StateObject private var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var selectedExpenseType: ExpenseType = .business

    var body: some View {
        NavigationStack {
           
            VStack(spacing: 28, content: {
                Picker("Type", selection: $selectedExpenseType) {
                    ForEach(ExpenseType.allCases, id: \.self) {
                        Text($0.description)
                    }
                }
                .padding(.horizontal, 12)
                .pickerStyle(.segmented)
                .onChange(of: selectedExpenseType) { newValue in
                    expenses.selectedExpenseType = newValue
                }

                List {
                    ForEach(expenses.items, id: \.id) { item in
                        ExpenseView(expenseItem: item)
                    }
                    .onDelete(perform: removeItems)
                }
            })
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddExpenseView(expenses: expenses)
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
            }
        }
    }
    
    // MARK: -
    
    private func removeItems(at offsets: IndexSet) {
        expenses.removeItems(at: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
