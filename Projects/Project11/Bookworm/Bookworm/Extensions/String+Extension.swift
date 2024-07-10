//
//  String+Extension.swift
//  Bookworm
//
//  Created by Chintan Maisuriya on 10/07/24.
//

import Foundation

extension String {
    var trimmed:String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
}
