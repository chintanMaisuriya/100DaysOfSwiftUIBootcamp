import UIKit

func getFormattedOddLuckyNumbers(_ numbers: [Int]) -> [String] {
    let oddNumbers = numbers.filter { $0 % 2 != 0 }
    let sortedOddNumbers = oddNumbers.sorted()
    let formattedOddNumbers = sortedOddNumbers.map{ "\($0) is a lucky number" }
    return formattedOddNumbers
}

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
getFormattedOddLuckyNumbers(luckyNumbers)
    .forEach{ print($0) }
