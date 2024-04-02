import UIKit

struct Car {
    private let model: String
    private let numberOfSeats: Int
    private let numberOfGears: Int
    
    private(set) var currentGear: Int {
        didSet {
            print("Current gear is changed to \(currentGear)")
        }
    }
    
    init(model: String, numberOfSeats totalSeats: Int, numberOfGears totalGears: Int) {
        self.model = model
        numberOfSeats = totalSeats
        numberOfGears = totalGears
        currentGear = 1
    }
    
    mutating func changeGearUp() {
        guard currentGear < numberOfGears else { return print("Already in gear \(numberOfGears)") }
        currentGear += 1
    }
    
    mutating func changeGearDown() {
        guard currentGear > 1 else { return print("Already in gear 1") }
        currentGear -= 1
    }
    
    func getModel() -> String {
        return model
    }
    
    func getTotalSeats() -> Int {
        return numberOfSeats
    }
}

var audi = Car(model: "Audi Q5", numberOfSeats: 5, numberOfGears: 5)
print(audi)
print(audi.changeGearUp())
print(audi.changeGearUp())
print(audi.changeGearDown())
print(audi.changeGearDown())
print(audi.changeGearDown())
print(audi.changeGearUp())
print(audi.changeGearUp())
print(audi.changeGearUp())
print(audi.changeGearUp())
print(audi.changeGearUp())
