//
//  NewTopLevelView.swift
//  ProIPhone_Ch07_SharingDataBetweenStructures
//
//  Created by Student Account on 9/28/23.
//

import SwiftUI

struct NewTopLevelView: View {
    @State private var isDarkMode = false
     @ObservedObject private var student = Student()
     @ObservedObject private var course = Course()

    var body: some View {
        VStack {
                   DarkModeToggleView(isDarkMode: $isDarkMode)

                   StudentEditorView(student: student)
                   Text("Student Information:")
                   Text("First Name: \(student.firstName)")
                   Text("Last Name: \(student.lastName)")

                   Divider()

                   CourseEditorView(course: course)
                   Text("Course Information:")
                   Text("Year: \(course.year)")
                   Text("Quarter: \(course.quarter)")
                   Text("Area: \(course.area)")
                   Text("Course Number: \(course.courseNumber)")
                   Text("Course Title: \(course.courseTitle)")
               }
    }
}

struct DarkModeToggleView: View {
    @Binding var isDarkMode: Bool

    var body: some View {
        Toggle("Dark Mode", isOn: $isDarkMode)
            .padding()
    }
}

struct NewTopLevelView_Previews: PreviewProvider {
    static var previews: some View {
        NewTopLevelView()
    }
}
