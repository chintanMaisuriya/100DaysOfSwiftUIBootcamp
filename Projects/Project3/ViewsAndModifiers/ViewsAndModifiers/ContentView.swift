//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Chintan Maisuriya on 25/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            /*
            // What is behind the main SwiftUI view?
            Text("Hello, world!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.red)
            */
            
            // Why modifier order matters
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
            
            Button("Hello World") {
                print(type(of: self.body))
            }
            .frame(width: 200, height: 200)
            .background(.red)

            
            Text("Hello There!")
                .titleStyle()
            
            VStack(spacing: 10) {
                CapsuleText(text: "First")
                    .foregroundStyle(.white)
                CapsuleText(text: "Second")
                    .foregroundStyle(.yellow)
            }
            
            GridStack(rows: 4, columns: 4) { row, col in
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: -

struct MottoView: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        VStack {
            VStack {
                motto1
                    .foregroundStyle(.red)
                motto2
                    .foregroundStyle(.blue)
            }
        }
    }
}

// MARK: -

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

// MARK: -

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}


//MARK: - Custom Modifier

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}
