//
//  MainView.swift
//  Edutainment
//
//  Created by Chintan Maisuriya on 07/05/24.
//

import SwiftUI

struct MainView: View {
    
    // MARK: -
    
    @Binding var multiplicationOperand  : Int
    @Binding var numberOfQuestions      : Int
    @Binding var difficulty             : DifficultyLevel
    @Binding var visibleScreen          : ScreenType
    @State private var scale            : CGFloat = 1
    
    private var title: some View {
        Text("Edutainment")
            .foregroundColor(.white)
            .font(.system(size: 38))
            .fontWeight(.bold)
    }
    
    private var titleView: some View {
        title
            .overlay {
                Image("mask")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .mask(title)
    }
    
    // MARK: -
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [.black, Color(hex: "#D2122E")], center: .center, startRadius: 25, endRadius: 500)
                .ignoresSafeArea()
            
            VStack {
                titleView
                
                Spacer()
                Spacer()
                
                Button {
                    visibleScreen = .quiz
                } label: {
                    Text("Start Quiz")
                        .font(.system( size: 22))
                        .fontWeight(.bold)
                        .frame(width: 140, height: 140)
                        .background(Color(hex: "#e4181e"))
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                }
                .padding(16)
                .scaleEffect(scale)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: true),
                    value: scale
                )
                .shadow(radius: 10)
                
                Spacer()
                
                VStack(alignment: .center, spacing: 22) {
                    VStack(spacing: 12, content: {
                        Text("Practice table of \(multiplicationOperand) using \(numberOfQuestions) questions with \(difficulty.rawValue) level difficulty")
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.4))
                        
                        Text("You can change this settings by tapping below ")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.35))
                    })
                    .padding(.top, 45)
                    .multilineTextAlignment(.center)
                    
                    Button {
                        visibleScreen = .settings
                    } label: {
                        Image(systemName: "gear")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                    }
                }
                
            }
            .padding()
            .onAppear {
                withAnimation {
                    scale = 1.07
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(multiplicationOperand: .constant(2), numberOfQuestions: .constant(10), difficulty: .constant(.easy), visibleScreen: .constant(.main))
    }
}
