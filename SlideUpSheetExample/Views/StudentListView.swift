//
//  StudentListView.swift
//  SlideUpSheetExample
//
//  Created by Russell Gordon on 2025-05-14.
//

import SwiftUI

struct StudentListView: View {
    
    // MARK: Stored properties
    @State private var viewModel = StudentListViewModel()
    
    // MARK: Computed properties

    // User interface
    var body: some View {
        NavigationStack{
            List(viewModel.studentsSorted) { currentStudent in
                StudentItemView(studentToShow: currentStudent)
            }
            .navigationTitle("Students")
        }
    }
}

#Preview {
    StudentListView()
}

