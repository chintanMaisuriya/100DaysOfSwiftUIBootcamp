//
//  QuizView.swift
//  Edutainment
//
//  Created by Chintan Maisuriya on 07/05/24.
//

import SwiftUI

struct QuizView: View {
    
    @State var questions                    : [Question]
    @State private var round                : Int = 1
    @State private var score                : Int = 0
    @State private var answered             : Bool = false
    @State private var showingGameOverAlert : Bool = false
    
    @State private(set) var userAnswer: Int? = nil
    
    private var totalNumberOfQuestions: Int {
        questions.count
    }
    
    private var currentQuestion: Question {
        questions[round - 1]
    }
    
    private var firstNumber: Int {
        currentQuestion.multiplicationOperand
    }
    
    private var secondNumber: Int {
        currentQuestion.operand
    }
    
    private var options: [Int] {
        currentQuestion.options
    }
    
    var resetGame: (() -> Void)?
    
    // MARK: -
    
    private var questionView: some View {
        VStack {
            HStack(spacing: 10, content: {
                NumberButton(firstNumber, color: .white)
                
                Image(systemName: "multiply")
                    .foregroundColor(.white.opacity(0.65))
                    .font(.largeTitle)
                
                NumberButton(secondNumber, color: .white)
                
                Image(systemName: "equal")
                    .foregroundColor(.white.opacity(0.65))
                    .font(.largeTitle)
                
                Text("?")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            })
            .padding(.bottom, 50)
        }
        .frame(maxWidth: .infinity)
    }
    
    private var BackgroundView: some View {
        VStack {
            Circle()
                .trim(from: 0.5, to: 1)
                .fill(Color(hex: "#800020"))
                .frame(width: 160, height: 160)
                .offset(y: 88)
                .zIndex(1)
                .overlay {
                    Text("\(round)")
                        .font(.custom("ChalkboardSE-Regular", size: 35))
                        .foregroundColor(.white.opacity(0.6))
                        .minimumScaleFactor(0.2)
                        .lineLimit(1)
                        .foregroundColor(.white)
                        .offset(y: 54)
                }
            
            RoundedRectangle(cornerRadius: 70)
                .fill(Color(hex: "#800020"))
                .frame(height: 200)
                .overlay {
                    questionView
                        .padding(.top, 48)
                }
        }
        .compositingGroup()
        .shadow(radius: 18)
    }
    
    
    var body: some View {
        ZStack {
            Color(hex: "#C40233")
                .ignoresSafeArea()
            
            VStack(spacing: 40, content: {
                BackgroundView
                    .padding(.horizontal, 20)
                
                
                HStack(spacing: 20) {
                    ForEach(options, id: \.self) { option in
                        Button {
                            verifyAnswer(option)
                        } label: {
                            let defaultAnswerBGColor = Color(hex: "#800020").opacity(0.85)
                            let selectedAnswerBGColor: Color = ((currentQuestion.answer == option) ? .green : .red)
                            let backgroundColor = (answered ? ((userAnswer == option) ? selectedAnswerBGColor : defaultAnswerBGColor) : defaultAnswerBGColor)
                            NumberButton(option, color: backgroundColor, type: .fill, size: 80)
                                .scaleEffect(answered ? (userAnswer == option ? 1.05 : 0.85) : 1)
                        }
                        .disabled(answered)
                        .animation(.linear(duration: 0.3), value: answered)
                    }
                }
                
                Button {
                    askQuestion()
                } label: {
                    Text("Next")
                        .font(.system(size: 36, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(hex: "#E9E3E6").opacity(answered ? 1 : 0.5))
                        .minimumScaleFactor(0.2)
                        .lineLimit(1)
                        .foregroundColor(.white)
                }
                .disabled(!answered)
                .alert("Quiz Over!", isPresented: $showingGameOverAlert) {
                    Button("Play again", action: reset)
                } message: {
                    Text("Your total score is \(score).")
                }
                
                Spacer()
                
                Button {
                    reset()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 44))
                        .foregroundColor(.orange)
                }
                
            })
            .padding(.vertical, 20)
            
        }
    }
    
    // MARK: -
    
    func verifyAnswer(_ selectOption: Int) {
        answered = true
        userAnswer = selectOption
        
        if selectOption == currentQuestion.answer {
            score += 1
        }
    }
    
    func askQuestion() {
        answered = false
        userAnswer = nil
        
        if round < totalNumberOfQuestions {
            round += 1
        } else {
            showingGameOverAlert = true
        }
    }
    
    func reset() {
        resetGame?()
        round = 1
        score = 0
        answered = false
        userAnswer = nil
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(questions: [
            Question(difficultLevel: .easy, multiplicationOperand: 2),
            Question(difficultLevel: .easy, multiplicationOperand: 2),
            Question(difficultLevel: .easy, multiplicationOperand: 2),
        ])
    }
}
