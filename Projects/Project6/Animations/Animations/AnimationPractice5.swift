//
//  AnimationPractice5.swift
//  Animations
//
//  Created by Chintan Maisuriya on 26/04/24.
//

import SwiftUI

// MARK: - Controlling the animation stack

struct AnimationPractice5: View {
    @State private var enabled = false

    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(response: 1, dampingFraction: 0.4, blendDuration: 0.6), value: enabled)
    }
}

struct AnimationPractice5_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPractice5()
    }
}
