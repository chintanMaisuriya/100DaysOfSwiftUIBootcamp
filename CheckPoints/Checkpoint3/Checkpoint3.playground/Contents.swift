import UIKit

// Way 1

print("By using Way 1")
print()

for i in 1...100 {
    if (i % 3 == 0 && i % 5 == 0) {
        print("\(i) - FizzBuzz")
    } else if (i % 3 == 0) {
        print("\(i) - Fizz")
    } else if (i % 5 == 0) {
        print("\(i) - Buzz")
    } else {
        print("\(i)")
    }
}

print()
print("********")

// Way 2

print("By using Way 2")
print()

for i in 1...100 {
    if (i.isMultiple(of: 3) && i.isMultiple(of: 5)) {
        print("FizzBuzz")
    } else if (i.isMultiple(of: 3)) {
        print("Fizz")
    } else if (i.isMultiple(of: 5)) {
        print("Buzz")
    } else {
        print("\(i)")
    }
}
