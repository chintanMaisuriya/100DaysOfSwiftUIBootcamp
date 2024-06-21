//
//  ActivityManager.swift
//  HabitTracker
//
//  Created by Chintan Maisuriya on 15/06/24.
//

import Foundation

class ActivityManager: ObservableObject {
    private let activitiesDataKey = "Activities"

    @Published private var activities: Activities = [] {
        didSet {
            persistData()
        }
    }
    
    init() {
        activities = getPersistedActivities() ?? []
    }
}

// MARK: -

private extension ActivityManager {
    func persistData() {
        let userDefaults = UserDefaults.standard
        
        defer {
            userDefaults.synchronize()
        }
        
        do {
            let data = try JSONEncoder().encode(activities)
            userDefaults.set(data, forKey: activitiesDataKey)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func getPersistedActivities() -> Activities? {
        var activities: Activities? = nil
        
        do {
            let userDefaults = UserDefaults.standard
            if let data = userDefaults.value(forKey: activitiesDataKey) as? Data {
                activities = try JSONDecoder().decode(Activities.self, from: data)
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
        
        return activities
    }
}

extension ActivityManager {
    func getActivities() -> [Activity] {
        return activities
    }
    
    func createNewActivity(_ newActivity: Activity) {
        activities.insert(newActivity, at: 0)
    }
    
    func updateAnActivity(_ activity: Activity) {
        guard let index = activities.firstIndex(of: activity) else { return }
        activities[index] = activity
    }
    
    func deleteActivityById(_ id: UUID) {
        activities = activities.filter { item in
            return item.id != id
        }
    }
    
    func deleteActivities(atOffset indexSet: IndexSet) {
        activities.remove(atOffsets: indexSet)
    }
}
