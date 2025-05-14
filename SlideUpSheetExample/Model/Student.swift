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


// Example students
let example1 = Student(firstName: "Nikita", lastName: "Zhdanov", currentGrade: .grad)
let example2 = Student(firstName: "Veda", lastName: "Cunniffe", currentGrade: .eleven)
let example3 = Student(firstName: "Sadie", lastName: "Mabbott", currentGrade: .ten)
let example4 = Student(firstName: "Niko", lastName: "Qose", currentGrade: .nine)
let example5 = Student(firstName: "Ethan", lastName: "Chen", currentGrade: .eleven)
let example6 = Student(firstName: "Hansen", lastName: "Chen", currentGrade: .grad)
let example7 = Student(firstName: "Evelyn", lastName: "Chen", currentGrade: .grad)

