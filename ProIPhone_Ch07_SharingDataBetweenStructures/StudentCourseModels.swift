//
//  StudentCourseModels.swift
//  ProIPhone_Ch07_SharingDataBetweenStructures
//
//  Created by Student Account on 9/28/23.
//

import Foundation
import SwiftUI

class Student: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
}

class Course: ObservableObject {
    @Published var year: String = ""
    @Published var quarter: String = ""
    @Published var area: String = ""
    @Published var courseNumber: String = ""
    @Published var courseTitle: String = ""
}

struct StudentEditorView: View {
    @ObservedObject var student: Student

    var body: some View {
        VStack {
            TextField("First Name", text: $student.firstName)
            TextField("Last Name", text: $student.lastName)
        }
        .padding()
    }
}

struct CourseEditorView: View {
    @ObservedObject var course: Course

    var body: some View {
        VStack {
            TextField("Year", text: $course.year)
            TextField("Quarter", text: $course.quarter)
            TextField("Area", text: $course.area)
            TextField("Course Number", text: $course.courseNumber)
            TextField("Course Title", text: $course.courseTitle)
        }
        .padding()
    }
}


