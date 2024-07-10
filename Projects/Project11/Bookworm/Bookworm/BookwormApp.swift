//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Chintan Maisuriya on 06/07/24.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
