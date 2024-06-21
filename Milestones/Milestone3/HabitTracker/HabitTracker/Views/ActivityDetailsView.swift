//
//  ActivityDetailsView.swift
//  HabitTracker
//
//  Created by Chintan Maisuriya on 13/06/24.
//

import SwiftUI

struct ActivityDetailsView: View {
    
    @ObservedObject var viewModel: ActivityDetailsViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .center, content: {
                Text(viewModel.selectedActivity.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 32)
                    .padding(.bottom, 0.5)
                
                Text(viewModel.selectedActivity.description)
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.bottom, 0.5)
                
                HStack(spacing: 28, content: {
                    
                    Button {
                        viewModel.decreaseCompletionCount()
                    } label: {
                        ZStack {
                            Image(systemName: "arrowtriangle.backward")
                                .font(.system(size: 70))
                                .fontWeight(.light)
                            
                            Image(systemName: "minus")
                                .font(.title3)
                                .fontWeight(.medium)
                                .padding(.leading, 12)
                        }
                    }
                    .foregroundColor((viewModel.selectedActivity.totalCompletion > 0) ? .black.opacity(0.4) : .black.opacity(0.2))
                    .disabled(viewModel.selectedActivity.totalCompletion < 1)
                    
                    VStack(alignment: .center, spacing: 8) {
                        Text("Completed for")
                        
                        Text(viewModel.getCompletionCountDescription())
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                    Button {
                        viewModel.increaseCompletionCount()
                    } label: {
                        ZStack {
                            Image(systemName: "arrowtriangle.forward")
                                .font(.system(size: 70))
                                .fontWeight(.light)
                            
                            Image(systemName: "plus")
                                .font(.title3)
                                .fontWeight(.medium)
                                .padding(.trailing, 12)
                        }
                    }
                    .foregroundColor(.black.opacity(0.4))

                })
                .padding(.top, 48)
                
            })
            .padding(.horizontal, 2)
            .padding(.vertical, 18)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.background)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Activity Details")
    }
}

struct ActivityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let activity = Activity(title: "Test", description: "Testing")
        let vm = ActivityDetailsViewModel(activityManager: ActivityManager(), selectedActivityItem: activity)
        ActivityDetailsView(viewModel: vm)
    }
}
