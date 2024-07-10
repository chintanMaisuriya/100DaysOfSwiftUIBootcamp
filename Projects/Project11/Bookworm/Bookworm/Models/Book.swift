//
//  Book.swift
//  Bookworm
//
//  Created by Chintan Maisuriya on 06/07/24.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var date: Date
}

// MARK: -

extension Book {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
        
        return dateFormatter.string(from: date ?? .now)
    }
}
