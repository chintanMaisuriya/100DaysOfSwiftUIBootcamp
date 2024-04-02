import UIKit

enum SquareRootError: Error {
    case outOfBounds, noSquareRoot
}

func getSquareRoot(Of number: Int) throws -> String {
    
    // guard instead of if for early returns
    guard number > 1 && number < 10_000 else {
        throw SquareRootError.outOfBounds
    }
    
    // Cleaner way of getting the first number that matches
    let result = (1...100)
        .first { $0 * $0 == number }
    
    // guard again
    guard let result = result else {
        throw SquareRootError.noSquareRoot
    }
    
    // Return the result
    return "\(result)"
}

do {
    let result = try getSquareRoot(Of: -81)
    print("The root is \(result)")
} catch SquareRootError.outOfBounds {
    print("Please use a number between 1 and 10_000")
} catch SquareRootError.noSquareRoot {
    print("There is no even squareroot to this problem")
} catch {
    print("Something went wrong")
}
