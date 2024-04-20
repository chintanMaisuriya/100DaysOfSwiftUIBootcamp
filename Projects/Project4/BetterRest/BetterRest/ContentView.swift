//
//  ContentView.swift
//  BetterRest
//
//  Created by Chintan Maisuriya on 19/04/24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    // MARK:  -
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    private static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    private var recommendedBedTime: String {
        return calculateBedtime()
    }
    
    // MARK:  -
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Select time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .foregroundColor(.black.opacity(0.3))
                }
                
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section("Daily coffee intake") {
                    Picker("Number of \(coffeeAmount > 1 ? "cups" : "cup")", selection: $coffeeAmount) {
                        ForEach(0..<21) {
                            Text("\($0)")
                        }
                    }
                }
                
                Section {
                    VStack(spacing: 18, content: {
                        Text("Your recommended bedtime is")
                            .font(Font.body)
                            .foregroundColor(.gray)

                        Text("\(recommendedBedTime)")
                            .font(Font.system(.largeTitle))
                    })
                    .frame(maxWidth: .infinity, idealHeight: 160, alignment: .center)
                }
            }
            .frame(maxHeight: .infinity, alignment: .center)
            .navigationTitle("BetterRest")
        }
    }
    
    // MARK: -
    
    private func calculateBedtime() -> String {
        do {
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
