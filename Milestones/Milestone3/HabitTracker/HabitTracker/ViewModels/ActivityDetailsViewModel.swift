//
//  ActivityDetailsViewModel.swift
//  HabitTracker
//
//  Created by Chintan Maisuriya on 15/06/24.
//

import Foundation

class ActivityDetailsViewModel: ObservableObject {
    private var manager: ActivityManager
    
    var selectedActivity: Activity {
        didSet {
            manager.updateAnActivity(selectedActivity)
        }
    }
    
    init(activityManager: ActivityManager, selectedActivityItem: Activity) {
        manager = activityManager
        selectedActivity = selectedActivityItem
    }
    
    // MARK - Extra Functions
    func increaseCompletionCount() {
        selectedActivity.increaseCompletionCount()
    }

    func decreaseCompletionCount() {
        selectedActivity.decreaseCompletionCount()
    }
    
    func getCompletionCountDescription() -> String {
        return selectedActivity.getCompletionCountDescription()
    }
}
