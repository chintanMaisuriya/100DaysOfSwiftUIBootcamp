//
//  ContentView.swift
//  HabitTracker
//
//  Created by Chintan Maisuriya on 24/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var activityManager = ActivityManager()
    
    var body: some View {
        ActivityListView(viewModel: ActivitiesViewModel(activityManager: activityManager))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
