//
//  ActivityListView.swift
//  HabitTracker
//
//  Created by Chintan Maisuriya on 15/06/24.
//

import SwiftUI

struct ActivityListView: View {
    @StateObject var viewModel: ActivitiesViewModel
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(viewModel.getActivities(), id:\.id) { (activity) in
                    NavigationLink {
                        ActivityDetailsView(viewModel: ActivityDetailsViewModel(activityManager: viewModel.getActivityManager(), selectedActivityItem: activity))
                    } label: {
                        HStack {
                            VStack(alignment: .leading, content: {
                                Text(activity.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.bottom, 0.5)
                                Text(activity.description)
                            })
                            .padding(.horizontal, 2)
                            .padding(.vertical, 8)
                            
                            Spacer()
                            
                            if (activity.totalCompletion > 0) {
                                Text("\(activity.totalCompletion)")
                                    .padding(12)
                                    .background {
                                        Circle()
                                            .foregroundColor(.green)
                                    }
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    
                }
                .onDelete { (indexset) in
                    viewModel.deleteActivities(atOffset: indexset)
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    NavigationLink {
                        AddActivityView(viewModel: AddActivityViewModel(activityManager: viewModel.getActivityManager()))
                    } label: {
                        Image(systemName: "note.text.badge.plus")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    
                }
            }
        }
    }
}

struct ActivityListView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = ActivitiesViewModel(activityManager: ActivityManager())
        ActivityListView(viewModel: vm)
    }
}
