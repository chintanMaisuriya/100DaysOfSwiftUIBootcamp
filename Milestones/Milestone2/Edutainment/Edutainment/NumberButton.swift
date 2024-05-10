//
//  NumberButton.swift
//  Edutainment
//
//  Created by Chintan Maisuriya on 07/05/24.
//

import SwiftUI

enum NumberButtonType {
    case none
    case fill
}

struct NumberButton: View {
    var number  : Int
    var color   : Color
    var type    : NumberButtonType
    var size    : Double
    
    init(_ number: Int, color: Color = .red, type: NumberButtonType = .none, size: Double = 60) {
        self.number = number
        self.color = color
        self.type = type
        self.size = size
    }
    
    
    var body: some View {
        Text("\(number)")
            .frame(width: size, height: size)
            .font(.custom("ChalkboardSE-Bold", size: size * 0.5))
            .minimumScaleFactor(0.005)
            .lineLimit(1)
            .foregroundColor(type == .none ? color : .white)
            .padding(8)
            .background(type == .none ? .clear : color)
            .clipShape(Circle())
            .shadow(radius: 4)
            .overlay(
                Circle()
                    .stroke(color, lineWidth: 5)
            )
    }
}

struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NumberButton(110)
            NumberButton(2, color: .purple, type: .fill)
            NumberButton(3, type: .fill, size: 100)
        }
    }
}
