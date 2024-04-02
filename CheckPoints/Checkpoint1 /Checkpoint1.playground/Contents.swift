import Foundation

enum TemparatureType {
    case celsius
    case farenheit
}


extension String.StringInterpolation {
    mutating func appendInterpolation(convertTemparature value: Double, to type: TemparatureType) {
        switch type {
        case .farenheit: appendInterpolation(convertInFarenheit: value)
        case .celsius: appendInterpolation(convertInCelsius: value)
        }
    }
    
    private mutating func appendInterpolation(convertInCelsius value: Double) {
        let formatedValue: Double = ((value - 32) * 5)/9
        appendLiteral(formatedValue.formatTemparature(of: .celsius))
    }
    
    private mutating func appendInterpolation(convertInFarenheit value: Double) {
        let formatedValue: Double = ((value * 9) / 5) + 32
        appendLiteral(formatedValue.formatTemparature(of: .farenheit))
    }
}

extension Double {
    func formatTemparature(of type: TemparatureType) -> String {
        switch type {
        case .farenheit:
            return "in Farenheit: \(self) °F"
        case .celsius:
            return "in Celsius: \(self) °C"
        }
    }
}


let temparatureInCelsius = 32.0
print("The temparature \(temparatureInCelsius.formatTemparature(of: .celsius)) | is \(convertTemparature: temparatureInCelsius, to: .farenheit)\n")

let temparatureInFarenheit = 87.0
print("The temparature \(temparatureInFarenheit.formatTemparature(of: .farenheit)) | is \(convertTemparature: temparatureInFarenheit, to: .celsius)\n")
