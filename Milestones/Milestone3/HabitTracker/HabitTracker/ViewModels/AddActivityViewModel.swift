//
//  AddActivityViewModel.swift
//  HabitTracker
//
//  Created by Chintan Maisuriya on 21/06/24.
//

import Foundation

class AddActivityViewModel: ObservableObject {
    private var manager: ActivityManager
    
    @Published var title: String = ""
    @Published var description: String = ""
    
    init(activityManager: ActivityManager) {
        manager = activityManager
    }
    
    // MARK - Extra Functions
    private func isValidTitle() -> Bool {
        title.isEmpty ? false : true
    }
    
    private func isValidDescription() -> Bool {
        description.isEmpty ? false : true
    }
    
    private func isValid() -> Bool {
        if !isValidTitle() || !isValidDescription() {
            return false
        }
        
        return true
    }
    
    private func getErrorDescription() -> String {
        if !isValidTitle() {
            return "Title must not be empty"
        } else if !isValidDescription() {
            return "Description must not be empty"
        } else {
            return "Something went wrong!"
        }
    }
    
    func createNewActivity(completion: () -> Void, error: (String) -> Void) {
        guard isValid() else {
            error(getErrorDescription())
            return
        }
        
        let activity = Activity(title: title, description: description)
        manager.createNewActivity(activity)
        completion()
    }
}
