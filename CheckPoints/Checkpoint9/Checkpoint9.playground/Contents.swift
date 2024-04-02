import UIKit

func getRandomInteger(arr: [Int]?) -> Int {
    arr?.randomElement() ?? Int.random(in: 1...100)
}

print(getRandomInteger(arr: [10,7,45,89,76,33,44,65,76,32,2,7,8]))
print(getRandomInteger(arr: nil))


//MARK: -  Interview Questions

func findMissingElements(baseArray: [Int], from array: [Int]) -> [Int] {
    //return baseArray.filter{ !array.contains($0)}
    
    var arr = [Int]()
    baseArray.forEach { int in
        guard !array.contains(int) else { return }
        arr.append(int)
    }
    
    return arr
}

print(findMissingElements(baseArray: Array(1...50), from: [2,13,4,5,40,44]))
