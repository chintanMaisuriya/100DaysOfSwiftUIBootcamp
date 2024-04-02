import UIKit

protocol Building {
    var name        : String { get }
    var totalRooms  : Int { get }
    var price       : Int { get }
    var estateAgent : String { get }
    
    func salesSummery()
}

extension Building {
    func salesSummery() {
        print("""
\n~~~~~~~~~~~~~~~~~~~~~~
*** \(name) on Sale ***
It has total \(totalRooms) rooms
The selling price is $\(price)

Please contact '\(estateAgent)' for an inquiry
~~~~~~~~~~~~~~~~~~~~~~\n
""")
    }
}


struct House: Building {
    private(set) var name: String
    private(set) var totalRooms: Int
    private(set) var price: Int
    private(set) var estateAgent: String
    
    mutating func updateName(_ name: String) {
        self.name = name
    }
    
    mutating func updateTotalRooms(_ totalRooms: Int) {
        self.totalRooms = totalRooms
    }
    
    mutating func updatePrice(_ price: Int) {
        self.price = price
    }
    
    mutating func updateAgent(_ agent: String) {
        self.estateAgent = agent
    }
}

struct Office: Building {
    private(set) var name: String
    private(set) var totalRooms: Int
    private(set) var price: Int
    private(set) var estateAgent: String
    
    mutating func updateName(_ name: String) {
        self.name = name
    }
    
    mutating func updateTotalRooms(_ totalRooms: Int) {
        self.totalRooms = totalRooms
    }
    
    mutating func updatePrice(_ price: Int) {
        self.price = price
    }
    
    mutating func updateAgent(_ agent: String) {
        self.estateAgent = agent
    }
}


let regentVilla = House(name: "Regent Villa", totalRooms: 3, price: 7500000, estateAgent: "Denny Browns")
print(regentVilla.salesSummery())

let blueOcean = Office(name: "Blue Ocean Pvt. Ltd.", totalRooms: 7, price: 10000000, estateAgent: "Russel Peter")
print(blueOcean.salesSummery())
