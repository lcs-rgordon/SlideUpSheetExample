//
//  Student.swift
//  SlideUpSheetExample
//
//  Created by Russell Gordon on 2025-05-14.
//

import Foundation

struct Student: Identifiable {
    
    // MARK: Stored properties
    let id = UUID()
    let firstName: String
    let lastName: String
    let currentGrade: Grade
    
}
