//
//  AddBookView.swift
//  Bookworm
//
//  Created by Chintan Maisuriya on 06/07/24.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var title            = ""
    @State private var author           = ""
    @State private var rating           = 3
    @State private var genre            = "Fantasy"
    @State private var review           = ""
    @State private var showErrorAlert   = false

    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]


    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                        .onChange(of: title) { newValue in
                            title = newValue.trimmed
                        }
                    
                    TextField("Author's name", text: $author)
                        .onChange(of: author) { newValue in
                            author = newValue.trimmed
                        }

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }

                Section {
                    Button("Save") {
                        add()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
    // MARK: -
    
    private func isFormValidated() -> Bool {
        guard !title.isEmpty else { return false }
        guard !author.isEmpty else { return false }
        guard !genre.isEmpty else { return false }
        return true
    }
    
    private func add() {
        guard isFormValidated else {
            showErrorAlert = true
            return
        }
        
        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: Date.now)
        modelContext.insert(newBook)
        dismiss()
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
