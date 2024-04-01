//
//  ContentView.swift
//  UnitConversions
//
//  Created by Chintan Maisuriya on 21/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var valueIsFocused  : Bool
    @State private var valueToConvert       : Double = 0.0
    @State private var measurement          : Int = 0
    @State private var formattedValue       : String = ""
    @State private var inputUnit            : String = ""
    @State private var outputUnit           : String = ""

    @State private var arrInputUnits    = [String]()
    @State private var arrOutputUnits   = [String]()

    private var arrMeasurements = MeasurementType.allCases

    private let valueFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        formatter.zeroSymbol = ""
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Mesurement", selection: $measurement) {
                        ForEach(arrMeasurements, id: \.rawValue) { type in
                            Text("\(type.description)")
                        }
                    }
                } header: {
                    Text("Please select the mesurement type")
                } .onChange(of: measurement) { _ in
                    loadUnits()
                } .onAppear {
                    loadUnits()
                }
                
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(arrInputUnits, id: \.self) { Text($0) }
                    }  .onChange(of: inputUnit) { _ in
                        getFormattedMeasureValue()
                    }
                    
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(arrOutputUnits, id: \.self) { Text($0) }
                    } .onChange(of: outputUnit) { _ in
                        getFormattedMeasureValue()
                    }
                    
                } header: {
                    Text("Please select the mesurement units")
                }
                
                Section {
                    TextField("Value", value: $valueToConvert, formatter: valueFormatter)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                        .onChange(of: valueToConvert) { _ in
                            getFormattedMeasureValue()
                        }
                } header: {
                    Text("Please enter value for the conversion")
                }
                
                Section {
                    Text(formattedValue)
                        .focused($valueIsFocused)
                } header: {
                    Text("The converted value")
                }
                
            }
            .navigationTitle("Unit Conversions")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        valueIsFocused = false
                    }
                }
            }
        }
    }
    
    private func loadUnits() {
        inputUnit = ""
        outputUnit = ""
        valueToConvert = 0
        
        let filteredUnits = MeasurementType(rawValue: measurement)?.units ?? []
        
        arrInputUnits.removeAll()
        arrInputUnits.append(contentsOf: filteredUnits)
        
        arrOutputUnits.removeAll()
        arrOutputUnits.append(contentsOf: filteredUnits)
    }
    
    private func getFormattedMeasureValue() {
        guard !inputUnit.isEmpty else {
            print("Please select input unit")
            formattedValue = ""
            return
        }
        
        guard !outputUnit.isEmpty else {
            print("Please select output unit")
            formattedValue = ""
            return
        }
        
        guard valueToConvert > 0 else {
            formattedValue = ""
            return
        }
        
        let type = MeasurementType(rawValue: measurement)
        switch type {
        
        case .Temperature:
            formattedValue = TemperatureUnits(rawValue: inputUnit)?.convert(to: TemperatureUnits(rawValue: outputUnit), value: valueToConvert) ?? ""
        
        case .Length:
            formattedValue = LengthUnits(rawValue: inputUnit)?.convert(to: LengthUnits(rawValue: outputUnit), value: valueToConvert) ?? ""
        
        case .Time:
            formattedValue = TimeUnits(rawValue: inputUnit)?.convert(to: TimeUnits(rawValue: outputUnit), value: valueToConvert) ?? ""
            
        case .Volume:
            formattedValue = VolumeUnits(rawValue: inputUnit)?.convert(to: VolumeUnits(rawValue: outputUnit), value: valueToConvert) ?? ""

        default:
            formattedValue  = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
