//
//  ContentView.swift
//  Moonshot
//
//  Created by Chintan Maisuriya on 14/05/24.
//

import SwiftUI

struct ContentView: View {
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [ GridItem(.adaptive(minimum: 150)) ]
    @State private var showList = false
    
    var body: some View {
        NavigationStack {
            Group {
                if showList {
                    ListLayout(missions: missions)
                } else {
                    GridLayout(missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    withAnimation(.easeInOut(duration: 1)) {
                        showList.toggle()
                    }
                } label: {
                    Image(systemName: showList ? "square.grid.2x2" : "list.bullet")
                        .font(Font.body)
                        .fontWeight(.bold)
                        .tint(.white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
