//
//  ContentView.swift
//  WordScramble
//
//  Created by Chintan Maisuriya on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: -
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var totalLetters = 0

    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    // MARK: -
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .onSubmit(addNewWord)
                }
                
                Section("Score: \(usedWords.count) words | \(totalLetters) letters") {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                Button("Start Game") {
                    startGame()
                }
            })
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") {
                    newWord = ""
                }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    // MARK: -
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "godfather"
                return
            }
        }

        fatalError("Could not load start.txt from bundle.")
    }
    
    private func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                
        guard isValidLength(word: answer) else {
            wordError(title: "Word is too short", message: "Your word should be equal or greater than 3 characters long enough!")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
            totalLetters += answer.count
        }
        
        newWord = ""
    }
    
    func isValidLength(word: String) -> Bool {
        word.count >= 3
    }
    
    private func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    private func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    private func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
