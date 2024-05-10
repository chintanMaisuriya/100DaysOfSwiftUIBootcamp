//
//  Enums.swift
//  Edutainment
//
//  Created by Chintan Maisuriya on 07/05/24.
//

import Foundation

// MARK: - DifficultyLevel

enum DifficultyLevel: String, Identifiable, CaseIterable {
    case easy
    case medium
    case hard
    
    var id: String { self.rawValue.capitalized }
}

// MARK: - ScreenType

enum ScreenType {
    case main
    case quiz
    case settings
}

// MARK: - Answer

enum Answer {
    case none
    case correct
    case incorrect
}
