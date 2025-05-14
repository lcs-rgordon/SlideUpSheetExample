//
//  StudentListViewModel.swift
//  SlideUpSheetExample
//
//  Created by Russell Gordon on 2025-05-14.
//

import Foundation

@Observable @MainActor
class StudentListViewModel: Observable {
    
    // MARK: Stored properties
    
    // List of students, stored in the order they were added to the array
    // NOTE: Pre-populated with example students from model
    var students: [Student] = [example1, example2, example3, example4, example5, example6, example7]
    
    // MARK: Computed properties

    // Return the array of students, first sorted by grade, then by last name, then by first name
    var studentsSorted: [Student] {

        // NOTE: If you are using a database (most students) the view model would
        //       likely never need to sort an array directly. Instead, we'd
        //       ask for the list of students from a database already sorted by
        //       the criteria we want.
        return students.sorted { firstStudent, secondStudent in
            (firstStudent.currentGrade.rawValue, firstStudent.lastName, firstStudent.firstName) < (secondStudent.currentGrade.rawValue, secondStudent.lastName, secondStudent.firstName)
        }
    }
    
    // MARK: Initializer(s)
    
    
    // MARK: Function(s)
    func add(newStudent: Student) {
        
        // Append the provided student to the list of tracked students
        self.students.append(newStudent)
        
    }
}
