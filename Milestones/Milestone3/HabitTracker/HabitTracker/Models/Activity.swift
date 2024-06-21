//
//  Activity.swift
//  HabitTracker
//
//  Created by Chintan Maisuriya on 24/05/24.
//

import Foundation

struct Activity: Codable, Identifiable {
    var id = UUID()
    let title: String
    let description: String
    var totalCompletion: Int = 0
    
    // MARK: -
    
    mutating func increaseCompletionCount() {
        totalCompletion += 1
    }
    
    mutating func decreaseCompletionCount() {
        totalCompletion = (totalCompletion > 1) ? totalCompletion - 1 : 0
    }
    
    func getCompletionCountDescription(count: Int = -1) -> String {
        let countValue = count < 0 ? totalCompletion : count
        return "\(countValue) time\(countValue > 1 ? "s" : "")"
    }
}

extension Activity: Equatable {
    static func ==(lhs: Activity, rhs: Activity) -> Bool {
        return lhs.id == rhs.id
    }
}


typealias Activities = [Activity]
