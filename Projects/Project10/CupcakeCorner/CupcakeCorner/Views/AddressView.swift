//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Chintan Maisuriya on 27/06/24.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var orderManger: OrderManager

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $orderManger.order.name)
                TextField("Street Address", text: $orderManger.order.streetAddress)
                TextField("City", text: $orderManger.order.city)
                TextField("Zip", text: $orderManger.order.zip)
            }

            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: orderManger.order)
                }
            }
            .disabled(orderManger.order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(orderManger: OrderManager())
    }
}
