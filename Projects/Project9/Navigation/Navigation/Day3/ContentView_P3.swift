//
//  ContentView_P3.swift
//  Navigation
//
//  Created by Chintan Maisuriya on 18/05/24.
//

import SwiftUI

struct ContentView_P3: View {
    @State private var title = "SwiftUI"

    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button("Tap1") {
                        // button action here
                    }
                    
                    Button("Tap2") {
                        // button action here
                    }
                }
            }
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            //.toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct ContentView_P3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_P3()
    }
}
