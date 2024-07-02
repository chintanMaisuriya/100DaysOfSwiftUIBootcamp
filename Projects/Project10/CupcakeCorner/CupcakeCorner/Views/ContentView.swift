//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Chintan Maisuriya on 27/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var orderManger = OrderManager()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $orderManger.order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper("Number of cakes: \(orderManger.order.quantity)", value: $orderManger.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $orderManger.order.specialRequestEnabled)

                    if orderManger.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $orderManger.order.extraFrosting)

                        Toggle("Add extra sprinkles", isOn: $orderManger.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery details") {
                        AddressView(orderManger: orderManger)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
