This project is a expense tracker that separates personal costs from business costs named as 'iExpense'. 

* While creating this project, We learned following things:
    * Using @State with classes
    * Sharing SwiftUI state with @Observable
    * Showing and hiding views
    * Deleting items using onDelete()
    * Storing user settings with UserDefaults
    * Archiving Swift objects with Codable
    * Building a list we can delete from
    * Working with Identifiable items in SwiftUI
    * Sharing an observed object with a new view
    * Making changes permanent with UserDefaults


# Challenges 

1. Use the user’s preferred currency, rather than always using US dollars.
2. Modify the expense amounts in ContentView to contain some styling depending on their value – expenses under $10 should have one style, expenses under $100 another, and expenses over $100 a third style. What those styles are depend on you.
3. For a bigger challenge, try splitting the expenses list into two sections: one for personal expenses, and one for business expenses. This is tricky for a few reasons, not least because it means being careful about how items are deleted!
