//
//  AnimationPractice4.swift
//  Animations
//
//  Created by Chintan Maisuriya on 26/04/24.
//

import SwiftUI

// MARK: - Explicit Animation

struct AnimationPractice4: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
            Button("Tap Me") {
                withAnimation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0.7)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        }
}

struct AnimationPractice4_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPractice4()
    }
}
