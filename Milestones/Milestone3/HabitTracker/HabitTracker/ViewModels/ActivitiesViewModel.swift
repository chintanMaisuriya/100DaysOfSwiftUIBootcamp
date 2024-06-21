//
//  ActivitiesViewModel.swift
//  HabitTracker
//
//  Created by Chintan Maisuriya on 24/05/24.
//

import Foundation

class ActivitiesViewModel: ObservableObject {
    private var manager: ActivityManager

    
    init(activityManager: ActivityManager) {
        manager = activityManager
    }
    
    func getActivityManager() -> ActivityManager {
        return manager
    }
    
    func getActivities() -> [Activity] {
        manager.getActivities()
    }
    
    func deleteActivityById(_ id: UUID) {
        manager.deleteActivityById(id)
    }
     
    func deleteActivities(atOffset indexSet: IndexSet) {
        manager.deleteActivities(atOffset: indexSet)
    }
}
