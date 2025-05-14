//
//  StudentListView.swift
//  SlideUpSheetExample
//
//  Created by Russell Gordon on 2025-05-14.
//

import SwiftUI

struct StudentListView: View {
    
    // MARK: Stored properties
    
    // Create view model to obtain data to show in this view
    @State private var viewModel = StudentListViewModel()
    
    // Tracks whether the sheet to allow new students to be added is shown
    @State private var showingAddStudentView = false
    
    // MARK: Computed properties

    // User interface
    var body: some View {
        NavigationStack{
            List(viewModel.studentsSorted) { currentStudent in
                StudentItemView(studentToShow: currentStudent)
            }
            // Show a title for this view
            .navigationTitle("Students")
            // Add a toolbar area to this view
            .toolbar {
                ToolbarItem {
                    Button {
                        showingAddStudentView = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            // Make a sheet appear when "+" button is clicked in toolbar
            .sheet(isPresented: $showingAddStudentView) {
                AddStudentView(isShowing: $showingAddStudentView)
                    // Control size of the sheet when it slides up
                    .presentationDetents([.fraction(0.4), .medium])
                    // Add the instance of the view model to the environment so it
                    // can be used by the view in the slide-up sheet
                    .environment(viewModel)
            }
        }
    }
}

#Preview {
    StudentListView()
}

