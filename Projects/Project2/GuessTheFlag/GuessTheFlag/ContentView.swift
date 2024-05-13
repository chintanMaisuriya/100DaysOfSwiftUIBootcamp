//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Chintan Maisuriya on 22/04/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: -
    
    @State private var showingError = false
    @State private var errorTitle = ""
    
    @State private var showingScore = false
    @State private var scoreTitle = "Total Score"
    @State private var numberOfQuestionAsked: Int = 0
    @State private var score: Int = 0
    @State private var animationAmount = 0.0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    // MARK: -
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [.purple, .black], center: .center, startRadius: 25, endRadius: 500)
                .ignoresSafeArea()
                        
            VStack {
                HStack() {
                    Spacer()
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center)) {
                        
                        VStack() {
                            Text("Current Score")
                                .frame( alignment: .center)
                                .padding(.vertical, 8)
                                .padding(.leading, 18)
                                .padding(.trailing, 60)
                                .background(.mint)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .stroke(.yellow, lineWidth: 4))
                                .shadow(radius: 8)
                                .font(
                                    .headline
                                        .weight(.semibold)
                                        .italic()
                                )
                                .foregroundStyle(.secondary)
                            
                            Text("#GuessTheFlag")
                                .font(.footnote.italic())
                                .foregroundStyle(.gray)
                        }
                        
                        
                        Text("\(score)")
                            .frame(width: 68, height: 68)
                        
                            .background(.mint)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(.yellow, lineWidth: 4))
                            .shadow(radius: 10)
                            .alignmentGuide(HorizontalAlignment.trailing) {
                                $0[HorizontalAlignment.center]
                            }
                            .font(.title
                                .weight(.bold)
                                .italic()
                            )
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 12)
                
                Spacer()
                
                VStack(spacing: 34) {
                    VStack(spacing: 8) {
                        Text("Question - \(numberOfQuestionAsked) / 8")
                            .foregroundColor(.white)
                            .font(
                                .title3
                                    .weight(.light)
                            )
                        
                        HStack() {
                            
                            Text("Tap the flag of")
                                .foregroundColor(.white)
                                .font(
                                    .title
                                        .weight(.regular)
                                        .italic()
                                )
                            
                            Text(countries[correctAnswer])
                                .foregroundColor(.white)
                                .font(
                                    .largeTitle
                                        .weight(.medium)
                                        .italic()
                                )
                        }
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            withAnimation(.spring(response: 2, dampingFraction: 0.4, blendDuration: 0.6)) {
                                animationAmount += 360
                            }
                            flagTapped(number)
                        } label: {
                            FlagImage(image: countries[number].lowercased())
                        }
                        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
                    }
                }
                .padding(.top, 12)
                
                Spacer()
                Spacer()
            }
            
        }
        .onAppear {
            numberOfQuestionAsked = 1
        }
        .alert(errorTitle, isPresented: $showingError, actions: {
            Button("Countinue", action: askQuestion)
        })
        .alert(scoreTitle, isPresented: $showingScore, actions: {
            Button("Restart", action: restartGame)
        }, message: {
            Text("Your score is \(score)")
        })
    }
    
    // MARK: -
    
    private func flagTapped(_ number: Int) {
        if (number == correctAnswer) {
            errorTitle = "Correct"
            score += 1
            askQuestion()
        } else {
            errorTitle = "Wrong!\nThat’s the flag of \(countries[number])"
            if score > 0 {
                score -= 1
            }
            showingError = true
        }
    }
    
    private func askQuestion() {
        if numberOfQuestionAsked >= 8 {
            showingScore = true
        } else {
            numberOfQuestionAsked += 1
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }
    
    private func restartGame() {
        score = 0
        numberOfQuestionAsked = 0
        askQuestion()
    }
}

// MARK: -

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
