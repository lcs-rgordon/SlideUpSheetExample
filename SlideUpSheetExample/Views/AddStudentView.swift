//
//  AddStudentView.swift
//  SlideUpSheetExample
//
//  Created by Russell Gordon on 2025-05-14.
//

import SwiftUI

struct AddStudentView: View {
    
    // MARK: Stored properties
    
    // Tracks whether this view is showing in a sheet or not
    @Binding var isShowing: Bool
    
    // Holds information related to the new student being added
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var grade: Grade = .nine
    
    // MARK: Computed properties
    
    // The user interface
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("First name", text: $firstName)
                        TextField("Last name", text: $lastName)
                        Picker("Grade", selection: $grade) {
                            Text(Grade.nine.displayName).tag(Grade.nine)
                            Text(Grade.ten.displayName).tag(Grade.ten)
                            Text(Grade.eleven.displayName).tag(Grade.eleven)
                            Text(Grade.grad.displayName).tag(Grade.grad)
                        }

                    }
                }
                // Allows form background color to be customized
                .background(Color.yellow)
                .scrollContentBackground(.hidden)
                
                Button {
                    // Will add student eventually
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

        }
    }
}

#Preview {
    
    @Previewable @State var showingAddStudentSheet = true
    
    Text("View the sheet is connected to")
        .sheet(isPresented: $showingAddStudentSheet) {
            AddStudentView(isShowing: $showingAddStudentSheet)
                .presentationDetents([.fraction(0.3), .medium])
        }
    
}
