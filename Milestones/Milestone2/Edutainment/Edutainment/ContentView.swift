//
//  ContentView.swift
//  Edutainment
//
//  Created by Chintan Maisuriya on 02/05/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: -

    @State private var scale                    : CGFloat = 1
    @State private var multiplicationOperand    : Int = 2
    @State private var numberOfQuestions        : Int = 10
    @State private var difficulty               : DifficultyLevel = .easy
    @State private var visibleScreen            : ScreenType = .main

    var body: some View {
        getView()
    }
    
    // MARK: -
    
    private func getView() -> some View {
        ZStack {            
            switch visibleScreen {
            case .quiz:
                let questions = generateQuestions()
                playQuiz(with: questions)
            case .settings:
                showSettings()
            default:
                showMainView()
            }
        }
        .animation(.easeOut(duration: 0.8), value: visibleScreen)
    }
    
    private func showMainView() -> some View {
        MainView(multiplicationOperand: $multiplicationOperand, numberOfQuestions: $numberOfQuestions, difficulty: $difficulty, visibleScreen: $visibleScreen)
    }
    
    private func showSettings() -> some View {
        Settings(multiplicationOperand: $multiplicationOperand, numberOfQuestions: $numberOfQuestions, difficulty: $difficulty) {
            visibleScreen = .main
        }
    }
    
    private func playQuiz(with questions: [Question]) -> some View {
        QuizView(questions: questions) {
            visibleScreen = .main
        }
    }
    
    private func generateQuestions() -> [Question] {
        var questions = [Question]()
        
        for _ in 1...numberOfQuestions {
            let question = Question(difficultLevel: difficulty, multiplicationOperand: multiplicationOperand)
            questions.append(question)
        }
        
        return questions
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
