//
//  ContentView.swift
//  Animations
//
//  Created by Chintan Maisuriya on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    private var rows: [String] = [
        "Implicit Animation",
        "Heartbeat Effect Animation",
        "Ripple Effect Animation",
        "Animation Bindings",
        "Explicit Animation",
        "Controlling the animation stack",
        "Animating gestures",
        "Animating gestures for letters (i.e. SnakeLetters Effect)",
        "Showing and hiding views with transitions",
        "Custom transitions using ViewModifier"
    ]
    
    
    var body: some View {
        NavigationView {
            List(rows, id: \.self) { row in
                NavigationLink(destination: view(row)) {
                    Text(row)
                        .font(.body)
                        .padding(8)
                }
            }
            .navigationTitle("Animations")
        }
        
    }
    
    @ViewBuilder
    private func view(_ name: String) -> some View {
        switch name {
        case "Implicit Animation":
            AnimationPractice1()
        case "Heartbeat Effect Animation":
            AnimationPractice2()
        case "Ripple Effect Animation":
            AnimationPractice2_1()
        case "Animation Bindings":
            AnimationPractice3()
        case "Explicit Animation":
            AnimationPractice4()
        case "Controlling the animation stack":
            AnimationPractice5()
        case "Animating gestures":
            AnimationPractice6()
        case "Animating gestures for letters (i.e. SnakeLetters Effect)":
            AnimationPractice6_1()
        case "Showing and hiding views with transitions":
            AnimationPractice7()
        case "Custom transitions using ViewModifier":
            AnimationPractice8()
        default:
            NoViewFound()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
