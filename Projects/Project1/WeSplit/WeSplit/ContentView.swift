//
//  ContentView.swift
//  WeSplit
//
//  Created by Chintan Maisuriya on 18/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPerson = 0
    @State private var tipPercentage = 0
    @FocusState private var amountIsFocused: Bool
    
    private let tipPercentages = Array(0..<101)
    private var currencyFormatter: FloatingPointFormatStyle<Double>.Currency {
        let currencyCode = Locale.current.currency?.identifier ?? "USD"
       return FloatingPointFormatStyle<Double>.Currency( code: currencyCode )
    }
    
    private var tipAmount: Double {
        let tipSelection = Double(tipPercentage)
        return checkAmount / 100 * tipSelection
    }
    
    private var grandTotal: Double {
        return checkAmount + tipAmount
    }
    
    private var totalPerPerson: Double {
        let personCount = Double(numberOfPerson + 2)
        let amountPerPerson = grandTotal / personCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: currencyFormatter)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPerson) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("How much tip do you want to give?")
                }
                
                Section {
                    VStack {
                        HStack {
                            Text("Original Amount")
                            Spacer()
                            Text(checkAmount, format: currencyFormatter)
                        }
                        Spacer()
                        HStack {
                            Text("Tip")
                            Spacer()
                            Text(tipAmount, format: currencyFormatter)
                        }
                    }
                    .foregroundColor(.black.opacity(0.45))
                    .padding(.vertical, 12)

                    HStack {
                        Text("Final Amount")
                        Spacer()
                        Text(grandTotal, format: currencyFormatter)
                    }
                    .fontWeight(.medium)
                }
                
                Section {
                    Text(totalPerPerson, format: currencyFormatter)
                        .fontWeight(.semibold)
                        .foregroundColor(tipPercentage == 0 ? .red : .black)

                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
