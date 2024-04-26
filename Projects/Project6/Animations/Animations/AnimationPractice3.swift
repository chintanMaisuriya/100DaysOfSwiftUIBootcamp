//
//  AnimationPractice3.swift
//  Animations
//
//  Created by Chintan Maisuriya on 26/04/24.
//

import SwiftUI

// MARK: - Animation Bindings

struct AnimationPractice3: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
        .padding(60)
    }
}

struct AnimationPractice3_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPractice3()
    }
}
