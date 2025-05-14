//
//  Grade.swift
//  SlideUpSheetExample
//
//  Created by Russell Gordon on 2025-05-14.
//

import Foundation

enum Grade: Int, CaseIterable, Identifiable {

    // MARK: Cases
    case nine = 9
    case ten = 10
    case eleven = 11
    case grad = 12

    // MARK: Computed properties
    
    // For conformance to Identifiable protocol
    var id: Int {
        return rawValue // e.g.: When .nine is selected, returns 9
    }

    // For use with a picker to show a human-readable name
    var displayName: String {
        switch self {
        case .nine:
            return "Grade 9"
        case .ten:
            return "Grade 10"
        case .eleven:
            return "Grade 11"
        case .grad:
            return "Grad"
        }
    }

}
