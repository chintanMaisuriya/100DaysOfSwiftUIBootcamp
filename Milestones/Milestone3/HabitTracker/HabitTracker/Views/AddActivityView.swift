//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Chintan Maisuriya on 13/06/24.
//

import SwiftUI

struct AddActivityView: View {
    
    @ObservedObject var viewModel: AddActivityViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var showErrorAlert = false
    @State var error: String = ""

    var body: some View {
        VStack {
            TextField("Title", text: $viewModel.title)
                .textFieldStyle(.roundedBorder)
            
            TextField("Description", text: $viewModel.description)
                .textFieldStyle(.roundedBorder)
            
            Button {
                viewModel.createNewActivity {
                    viewModel.title = ""
                    viewModel.description = ""
                    dismiss()
                } error: { (error) in
                    self.error = error
                    showErrorAlert = true
                }
            } label: {
                Text("Save")
            }
            
            Spacer()
        }
        .padding()
        .background(.background)
        .alert("⚠️", isPresented: $showErrorAlert) {} message: {
            Text(error)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Add Activity")
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = AddActivityViewModel(activityManager: ActivityManager())
        AddActivityView(viewModel: vm)
    }
}
