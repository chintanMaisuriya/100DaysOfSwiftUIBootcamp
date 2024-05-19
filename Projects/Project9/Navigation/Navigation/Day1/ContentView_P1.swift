//
//  ContentView_P1.swift
//  Navigation
//
//  Created by Chintan Maisuriya on 18/05/24.
//

import SwiftUI

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView_P1: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
            .navigationDestination(for: Student.self) { student in
                Text("You selected \(student.name)")
            }
        }
        
    }
}

struct ContentView_P1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_P1()
    }
}
