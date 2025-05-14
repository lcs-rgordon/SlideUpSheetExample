//
//  StudentItemView.swift
//  SlideUpSheetExample
//
//  Created by Russell Gordon on 2025-05-14.
//

import SwiftUI

struct StudentItemView: View {

    // MARK: Stored properties
    let studentToShow: Student
    
    // MARK: Computed properties
    
    // User interface
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(studentToShow.lastName), \(studentToShow.firstName)")
                .font(.title3)
            
            Text(studentToShow.currentGrade.displayName)
        }
    }
}

#Preview {
    StudentItemView(studentToShow: example1)
}
