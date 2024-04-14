//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Chintan Maisuriya on 12/04/24.
//

import SwiftUI

// MARK: -

enum Moves: CaseIterable {
    case rock
    case paper
    case scissor
    
    var emoji: String {
        switch self {
        case .rock      : return "👊"
        case .paper     : return "🖐"
        case .scissor   : return "✌️"
        }
    }
}

struct ContentView: View {
    
    // MARK: -

    @State private var viewSize = CGSize()
    @State private var moves: [Moves] = Moves.allCases
    @State private var botMove        = Int.random(in: 0...2)
   
    @State private var botInstruction   : Bool = .random()
    @State private var shouldAnimate    : Bool = false
    @State private var showScore        : Bool = false
    @State private var endGame          : Bool = false
    @State private var result           : Bool? = nil

    @State private var round        = 1
    @State private var score        = 0
    @State private var scoreTitle   = ""
    @State private var scoreMessage = ""
    
    private var maximumRounds   = 10
    private let blueColor       = Color(red: 0.1, green: 0.2, blue: 0.45)
    private let redColor        = Color(red: 0.76, green: 0.15, blue: 0.26)

    // MARK: -

    var body: some View {
        ZStack {
            GeometryReader { proxy in
                
                RadialGradient(
                    stops: [.init(color: blueColor, location: 0.3), .init(color: redColor, location: 0.3)],
                    center: .top,
                    startRadius: 0,
                    endRadius: viewSize.height * 1.7
                )
                .onAppear {
                    viewSize = proxy.size
                }
            }
            .ignoresSafeArea()
            
            VStack() {
                
                VStack(alignment: .center, spacing: 8, content: {
                    Text("\(moves[botMove].emoji)")
                        .padding(.top, 40)
                        .padding(.bottom, 4)
                        .font(.system(size: 140))
                    
                    Text(botInstruction ? "Play to win" : "Play to lose")
                        .font(.title)
                        .foregroundColor(.white)
                })
                .scaleEffect(shouldAnimate ? 0.9 : 1)
                .opacity(shouldAnimate ? 1 : 0.9)
                .animation(
                    .easeInOut(duration: 3)
                    .repeatCount(5, autoreverses: true)
                    .speed(12),
                    value: shouldAnimate
                )
                .onAppear {
                    shouldAnimate.toggle()
                }
                .alert(isPresented: $showScore) {
                    Alert(title: Text(scoreTitle), message: Text(scoreMessage), dismissButton: .default(Text("Continue")) {
                        self.setNextRound()
                    })
                }
                
                Spacer()
                Spacer()
                
                VStack(alignment: .center, spacing: 60, content: {
                    HStack {
                        Text("Score: \(score)")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Game Round: \(round)")
                            .fontWeight(.regular)
                        
                    }
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .font(.title2)
                    
                    HStack() {
                        ForEach(moves, id: \.self) { move in
                            Button(action: {
                                checkMove(move)
                            }) {
                                Text(move.emoji)
                                    .font(.system(size: 50))
                                    .frame(width: 90, height: 90)
                                    .background(Circle())
                                    .foregroundColor(blueColor)
                                    .clipShape(Capsule())
                                    .shadow(color: .yellow, radius: 8, x: 0, y: 0)
                                
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)
                    .alert(isPresented: $endGame) {
                        Alert(title: Text("Game Over"), message: Text("Your Final score is: \(score)"), dismissButton: .cancel(Text("Restart"), action: {
                            self.restartGame()
                        }))
                    }
                })
                
                Spacer()
            }
            
        }
    }
    
    // MARK: -
    
    func setNextRound() {
        if round == maximumRounds {
            DispatchQueue.main.async {
                self.endGame = true
            }
        } else {
            shouldAnimate.toggle()

            DispatchQueue.main.async {
                self.round += 1
                self.resetGame()
            }
        }
    }
    
    func resetGame() {
        botMove         = Int.random(in: 0...2)
        botInstruction  = Bool.random()
        result          = nil
    }
    
    func restartGame() {
        shouldAnimate.toggle()
       
        DispatchQueue.main.async {
            self.resetGame()
            self.round = 1
            self.score = 0
        }
    }

    func checkMove(_ answer: Moves) {
        let bot = moves[botMove]
        
        if botInstruction {
            switch bot {
            case .rock      : result = (answer == .paper) ? true : false
            case .paper     : result = (answer == .scissor) ? true : false
            case .scissor   : result = (answer == .rock) ? true : false
            }
        } else {
            switch bot {
            case .rock      : result = (answer == .scissor) ? true : false
            case .paper     : result = (answer == .rock) ? true : false
            case .scissor   : result = (answer == .paper ) ? true : false
            }
        }
        
        if bot == answer { result = nil }
        
        if let result = result, result {
            scoreTitle      = "Hola!"
            scoreMessage    = "You Win.. 🥳"
            score += 1
        } else if let result = result, !result {
            scoreTitle      = "Oops!"
            scoreMessage    = "You Lose.. 😓"
            if (score > 0) { score -= 1 }
        } else {
            scoreTitle = "Really?"
            scoreMessage = "Do you even know how to play this game? 🤔"
        }
        
        showScore = true
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
