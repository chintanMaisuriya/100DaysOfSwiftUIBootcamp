//
//  Enums.swift
//  UnitConversions
//
//  Created by Chintan Maisuriya on 21/04/23.
//

import Foundation

//MARK: - Enum: MeasurementType

enum MeasurementType: Int, CaseIterable {
    case Temperature
    case Length
    case Time
    case Volume
    
    var description: String {
        switch self {
        case .Temperature: return "Temperature"
        case .Length: return "Length"
        case .Time: return "Time"
        case .Volume: return "Volume"
        }
    }
    
    var units: [String] {
        switch self {
        case .Temperature:
            return TemperatureUnits.allCases.map { $0.rawValue }
        case .Length:
            return LengthUnits.allCases.map { $0.rawValue }
        case .Time:
            return TimeUnits.allCases.map { $0.rawValue }
        case .Volume:
            return VolumeUnits.allCases.map { $0.rawValue }
        }
    }
}

//MARK: - Enum: TemperatureUnits

enum TemperatureUnits: String, CaseIterable {
    case dafault = "Select"
    case Celsius
    case Fahrenheit
    case Kelvin
    
    private func unitTemperature(_ type: TemperatureUnits?) -> UnitTemperature? {
        switch type {
        case .Celsius       : return .celsius
        case .Fahrenheit    : return .fahrenheit
        case .Kelvin        : return .kelvin
        default             : return nil
        }
    }
    
    func convert(to unit: TemperatureUnits?, value: Double) -> String {
        guard let inputUnit = unitTemperature(self), let outputUnit = unitTemperature(unit) else { return "" }
        let tempV: Measurement<UnitTemperature> = Measurement(value: value, unit: inputUnit)
        
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.numberFormatter.minimumFractionDigits = 1
        formatter.numberFormatter.maximumFractionDigits = 1

        return formatter.string(from: tempV.converted(to: outputUnit))
    }
}



//MARK: - Enum: LengthUnits

enum LengthUnits: String, CaseIterable {
    case dafault = "Select"
    case meters
    case kilometers
    case feet
    case yards
    case miles
    
    private func unitLength(_ type: LengthUnits?) -> UnitLength? {
        switch type {
        case .meters        : return .meters
        case .kilometers    : return .kilometers
        case .feet          : return .feet
        case .yards         : return .yards
        case .miles         : return .miles
        default             : return nil
        }
    }
    
    private func formatterUnit(_ type: LengthUnits?) -> LengthFormatter.Unit? {
        switch type {
        case .meters        : return .meter
        case .kilometers    : return .kilometer
        case .feet          : return .foot
        case .yards         : return .yard
        case .miles         : return .mile
        default             : return nil
        }
    }
    
    func convert(to unit: LengthUnits?, value: Double) -> String {
        guard let inputUnit = unitLength(self) else { return "" }
        guard let outputUnit = unitLength(unit), let formatterUnit = formatterUnit(unit) else { return "" }

        let tempV: Measurement<UnitLength> = Measurement(value: value, unit: inputUnit)
        
        let formatter = LengthFormatter()
        formatter.numberFormatter.minimumFractionDigits = 1
        formatter.numberFormatter.maximumFractionDigits = 1
        
        return formatter.string(fromValue: tempV.converted(to: outputUnit).value, unit: formatterUnit)
    }
}

//MARK: - Enum: TimeUnits

enum TimeUnits: String, CaseIterable {
    case dafault = "Select"
    case seconds
    case minutes
    case hours
    case days
    
    private func unitTime(_ type: TimeUnits?) -> UnitDuration? {
        switch type {
        case .seconds   : return .seconds
        case .minutes   : return .minutes
        case .hours     : return .hours
        case .days      : return .days
        default         : return nil
        }
    }
    
    func convert(to unit: TimeUnits?, value: Double) -> String {
        guard let inputUnit = unitTime(self), let outputUnit = unitTime(unit) else { return "" }
        let tempV: Measurement<UnitDuration> = Measurement(value: value, unit: inputUnit)
        return tempV.converted(to: outputUnit).description
    }
}

//MARK: - Enum: VolumeUnits

enum VolumeUnits: String, CaseIterable {
    case dafault = "Select"
    case milliliters
    case liters
    case cups
    case pints
    case gallons
    
    private func unitVolume(_ type: VolumeUnits?) -> UnitVolume? {
        switch type {
        case .milliliters   : return .milliliters
        case .liters        : return .liters
        case .cups          : return .cups
        case .pints         : return .pints
        case .gallons       : return .gallons
        default             : return nil
        }
    }
    
    func convert(to unit: VolumeUnits?, value: Double) -> String {
        guard let inputUnit = unitVolume(self), let outputUnit = unitVolume(unit) else { return "" }
        let tempV: Measurement<UnitVolume> = Measurement(value: value, unit: inputUnit)
        
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.numberFormatter.minimumFractionDigits = 1
        formatter.numberFormatter.maximumFractionDigits = 3

        return formatter.string(from: tempV.converted(to: outputUnit))
    }
}
