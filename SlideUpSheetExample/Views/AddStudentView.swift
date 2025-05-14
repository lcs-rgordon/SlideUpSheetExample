//
//  AddStudentView.swift
//  SlideUpSheetExample
//
//  Created by Russell Gordon on 2025-05-14.
//

import SwiftUI

struct AddStudentView: View {
    
    // MARK: Stored properties
    @Binding var isShowing: Bool
    
    // MARK: Computed properties
    
    // The user interface
    var body: some View {
        Text("I am a sheet")
    }
}

#Preview {
    
    @Previewable @State var showingAddStudentSheet = true
    
    Text("View the sheet is connected to")
        .sheet(isPresented: $showingAddStudentSheet) {
            AddStudentView(isShowing: $showingAddStudentSheet)
                .presentationDetents([.fraction(0.15), .medium])
        }
    
}
