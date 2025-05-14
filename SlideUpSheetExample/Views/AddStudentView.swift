//
//  AddStudentView.swift
//  SlideUpSheetExample
//
//  Created by Russell Gordon on 2025-05-14.
//

import SwiftUI

struct AddStudentView: View {
    
    // NOTE: Technique used to set default focus based on this tutorial...
    //       https://www.hackingwithswift.com/quick-start/swiftui/how-to-make-a-textfield-or-texteditor-have-default-focus
    enum FocusedField {
        case firstName
        case lastName
        case grade
    }
    
    // MARK: Stored properties
    
    // Tracks which field has the focus (cursor)
    @FocusState private var currentlyFocusedField: FocusedField?
    
    // Tracks whether this view is showing in a sheet or not
    @Binding var isShowing: Bool
    
    // Holds information related to the new student being added
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var grade: Grade = .nine
    
    // Access to view model to be able to add a new student
    @Environment(StudentListViewModel.self) var viewModel
    
    // MARK: Computed properties
    
    // The user interface
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("First name", text: $firstName)
                            .focused($currentlyFocusedField, equals: .firstName)
                        TextField("Last name", text: $lastName)
                            .focused($currentlyFocusedField, equals: .lastName)
                        Picker("Grade", selection: $grade) {
                            Text(Grade.nine.displayName).tag(Grade.nine)
                            Text(Grade.ten.displayName).tag(Grade.ten)
                            Text(Grade.eleven.displayName).tag(Grade.eleven)
                            Text(Grade.grad.displayName).tag(Grade.grad)
                        }
                        .focused($currentlyFocusedField, equals: .grade)

                    }
                }
                // Set the default focus when the form appears
                .onAppear {
                    currentlyFocusedField = .firstName
                }
                // Allows form background color to be customized
                .background(Color.yellow)
                .scrollContentBackground(.hidden)
                
                Button {
                    // Add new student using view model
                    viewModel.add(
                        newStudent: Student(
                            firstName: firstName,
                            lastName: lastName,
                            currentGrade: grade
                        )
                    )
                    
                    // Reset input fields
                    firstName = ""
                    lastName = ""
                    grade = .nine
                    
                    // Place focus back on the first field
                    currentlyFocusedField = .firstName
                } label: {
                    Text("Add student")
                }
                .buttonStyle(.borderedProminent)

            }
            // Set background colour of VStack to match form
            .background {
                Color.yellow
                    .ignoresSafeArea()
            }
            // Add toolbar to allow form to be dismissed
            .toolbar {
                ToolbarItem {
                    Button {
                        // Dismiss this sheet
                        isShowing = false
                    } label: {
                        Text("Done")
                    }
                }
            }

        }
    }
}

#Preview {
    
    @Previewable @State var showingAddStudentSheet = true
    
    Text("View the sheet is connected to")
        .sheet(isPresented: $showingAddStudentSheet) {
            AddStudentView(isShowing: $showingAddStudentSheet)
                .presentationDetents([.fraction(0.4), .medium])
                // Insert an instance of the view model into the environment
                // so Previews window will not crash
                .environment(StudentListViewModel())
        }
    
}
