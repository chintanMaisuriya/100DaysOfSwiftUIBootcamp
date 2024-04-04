This project is a check-splitting app that we might use after eating at a restaurant – we enter the cost of our food, select how much of a tip we want to leave, and how many people we’re with, and it will tell us how much each person needs to pay. While creating this project we learnt following things so far:

• Understand the basic structure of a SwiftUI app
• Create a form using TextField, Text, Picker, Segment controls
• Add a navigation bar to the view
• Mutate a property declared in the SwiftUI using '@State' property wrapper. One of the great things about the '@State' property wrapper is that it automatically observe the changes, and when the value of the property changes it will automatically re-invoke the body property.
• Two-way binding to user interface controls using '$' sign
• Creating multiple views while iterating over the chunk of data using ForEach loop. This can loop over arrays and ranges, creating as many views as needed.
• Keyboard hiding in SwiftUI using @FocusState property wrapper. This is exactly like a regular @State property, except it’s specifically designed to handle input focus in UI.



