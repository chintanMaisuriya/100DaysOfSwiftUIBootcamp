//
//  Order.swift
//  CupcakeCorner
//
//  Created by Chintan Maisuriya on 27/06/24.
//

import Foundation

class Order: Codable {
    static let types    = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    var type            = 0
    var quantity        = 3
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting   = false
    var addSprinkles    = false
    var name            = ""
    var streetAddress   = ""
    var city            = ""
    var zip             = ""
    
    private enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    init(type: Int = 0, quantity: Int = 3, specialRequestEnabled: Bool = false, extraFrosting: Bool = false, addSprinkles: Bool = false, name: String = "", streetAddress: String = "", city: String = "", zip: String = "") {
        self.type = type
        self.quantity = quantity
        self.specialRequestEnabled = specialRequestEnabled
        self.extraFrosting = extraFrosting
        self.addSprinkles = addSprinkles
        self.name = name
        self.streetAddress = streetAddress
        self.city = city
        self.zip = zip
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: ._type)
        try container.encode(quantity, forKey: ._quantity)
        try container.encode(extraFrosting, forKey: ._extraFrosting)
        try container.encode(addSprinkles, forKey: ._addSprinkles)
        try container.encode(name, forKey: ._name)
        try container.encode(streetAddress, forKey: ._streetAddress)
        try container.encode(city, forKey: ._city)
        try container.encode(zip, forKey: ._zip)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(Int.self, forKey: ._type)
        quantity = try container.decode(Int.self, forKey: ._quantity)
        extraFrosting = try container.decode(Bool.self, forKey: ._extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: ._addSprinkles)
        name = try container.decode(String.self, forKey: ._name)
        streetAddress = try container.decode(String.self, forKey: ._streetAddress)
        city = try container.decode(String.self, forKey: ._city)
        zip = try container.decode(String.self, forKey: ._zip)
    }
    
    // MARK: -
    
    var hasValidAddress: Bool {
        if !isValidInput(name) || !isValidInput(streetAddress) || !isValidInput(city) || !isValidInput(zip) {
            return false
        }

        return true
    }
    
    var cost: Decimal {
        // $2 per cake
        var cost = Decimal(quantity) * 2

        // complicated cakes cost more
        cost += Decimal(type) / 2

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }

        return cost
    }
    
    private func isValidInput(_ val: String) -> Bool {
        !val.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
