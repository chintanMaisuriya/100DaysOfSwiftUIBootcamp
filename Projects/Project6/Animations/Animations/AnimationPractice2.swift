//
//  AnimationPractice2.swift
//  Animations
//
//  Created by Chintan Maisuriya on 26/04/24.
//

import SwiftUI

// MARK: - Heartbeat Effect Animation

struct AnimationPractice2: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        // .animation(.linear, value: animationAmount)
        // .animation(.spring(response: 0.7, dampingFraction: 0.4, blendDuration: 0.9), value: animationAmount)
        // .animation(.easeInOut(duration: 1), value: animationAmount)
        
        /*
        .animation(
            .easeInOut(duration: 1)
                .delay(1),
            value: animationAmount
        )
         */
        
        /*
        .animation(
            .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true),
            value: animationAmount
        )
         */
        
        .animation(
            .easeInOut(duration: 1)
                .repeatForever(autoreverses: true),
            value: animationAmount
        )
    }
}

struct AnimationPractice2_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPractice2()
    }
}

// MARK: - Ripple Effect Animation

struct AnimationPractice2_1: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
        }
        .frame(width: 140, height: 140, alignment: .center)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount
                )
            , alignment: .center)
        .onAppear {
            animationAmount = 2
        }
    }
}

struct AnimationPractice2_1_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPractice2_1()
    }
}
