//
//  Settings.swift
//  Edutainment
//
//  Created by Chintan Maisuriya on 04/05/24.
//

import SwiftUI

struct Settings: View {
    
    // MARK: -
    
    @Binding var multiplicationOperand  : Int
    @Binding var numberOfQuestions      : Int
    @Binding var difficulty             : DifficultyLevel
    private let questions   : [Int] = [10, 15, 20, 25]
    
    var saveSettingsAction: (() -> Void)?
    
    // MARK: -
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Please select multiplication table you want to practice") {
                    Stepper("\(multiplicationOperand)", value: $multiplicationOperand, in: 2...12, step: 1) { change in
                        print(change)
                    }
                }
                
                Section("Please select the total number of questions to practice") {
                    Picker("Questions", selection: $numberOfQuestions) {
                        ForEach(questions, id: \.self) {
                            Text("\($0)")
                                .font(.largeTitle)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Please select the difficulty level") {
                    Picker("Difficulty", selection: $difficulty) {
                        ForEach(DifficultyLevel.allCases, id: \.id) {
                            Text("\($0.id)")
                                .tag($0)
                                .font(.largeTitle)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text("You're going to practice table of \(multiplicationOperand) using \(numberOfQuestions) questions with \(difficulty.rawValue) level difficulty based on the selection above")
                        .multilineTextAlignment(.center)
                }
                .foregroundColor(.secondary)
                .listRowBackground(Color.clear)
            }
            .navigationTitle("Settings")
            .toolbar {
                Button("Save") {
                    saveSettingsAction?()
                }
            }
        }
        
    }
    
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(multiplicationOperand: .constant(2), numberOfQuestions: .constant(10), difficulty: .constant(.easy))
    }
}

