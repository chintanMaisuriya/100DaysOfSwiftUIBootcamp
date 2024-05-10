//
//  Question.swift
//  Edutainment
//
//  Created by Chintan Maisuriya on 06/05/24.
//

import Foundation

struct Question {
    
    // MARK: -
    
    var multiplicationOperand: Int

    var answer: Int {
        multiplicationOperand * operand
    }
    
    private var optionsRange: ClosedRange<Int> {
        switch difficultLevel {
        case .easy      : return 1...20
        case .medium    : return 21...50
        case .hard      : return 51...200
        }
    }
    
    private(set) var operand: Int = 0
    private(set) var difficultLevel: DifficultyLevel
    private(set) var options = [Int]()
    
    // MARK: -

    init(difficultLevel: DifficultyLevel, multiplicationOperand: Int) {
        self.difficultLevel = difficultLevel
        self.multiplicationOperand = multiplicationOperand
        self.operand = getOperand()
        self.options = getMultipleChoiceAnswerOptions()
    }
    
    private func getOperand() -> Int {
        Int.random(in: optionsRange)
    }
    
    private func getMultipleChoiceAnswerOptions() -> [Int] {
        var answers = [Int]()
        answers.append(answer)
        
        while answers.count < 3 {
            let option = Int.random(in: optionsRange)
            guard !answers.contains(option) else { continue }
            answers.append(option)
        }
        
        return answers.shuffled()
    }
}
