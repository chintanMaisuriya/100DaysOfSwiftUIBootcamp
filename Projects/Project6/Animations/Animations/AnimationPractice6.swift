//
//  AnimationPractice6.swift
//  Animations
//
//  Created by Chintan Maisuriya on 26/04/24.
//

import SwiftUI

// MARK: - Animating gestures

struct AnimationPractice6: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0.5)) {
                            dragAmount = .zero
                        }
                    }
            )
            .animation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0.5), value: dragAmount)
        
    }
}

struct AnimationPractice6_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPractice6()
    }
}

// MARK: - SnakeLetters Effect (i.e. Animating gestures for letters)

struct AnimationPractice6_1: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

struct AnimationPractice6_1_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPractice6_1()
    }
}
