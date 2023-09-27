//
//  BackgroundColorView.swift
//  ProIPhone_Ch07_SharingDataBetweenStructures
//
//  Created by Student Account on 10/10/23.
//

import SwiftUI

struct InClassActivity: View {
    @State private var darkMode: Bool = false
    @StateObject private var student = Student()
    @StateObject private var course = Course()
    var body: some View {
        VStack{
            toggleView(mode: $darkMode)
                .padding(50)
                .cornerRadius(20)
    
            
            VStack{
                HStack{
                    Text("Student: ")
                    Text(student.first)
                    Text(student.last)
                }
                .padding(.bottom)
                Text("Course: ")
                Text(course.courseTitle)
                HStack{
                    Text(course.area)
                    Text(String(course.courseNumber))
                }
                HStack{
                    Text(course.quarter)
                    Text(String(course.year))
                }
            }
            .padding(50)
            .cornerRadius(20)
            EditClasses(student: student, course: course)
                .padding(50)
                .cornerRadius(20)
                .background(darkMode ? Color(.white): Color(.gray))
                .foregroundColor(darkMode ? Color(.black): Color(.white))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(darkMode ? Color(.gray): Color(.white))
        .foregroundColor(darkMode ? Color(.white): Color(.black))
    }
}

#Preview {
    InClassActivity()
}
struct EditClasses: View {
    @ObservedObject var student: Student
    @ObservedObject var course: Course
    var body: some View {
        VStack {
            HStack {
                Text("First Name:")
                TextField("Type a name here", text: $student.first)
            }
            HStack {
                Text("Last Name:")
                TextField("Type a breed here", text: $student.last)
            }
            TextField("Course Title", text: $course.courseTitle)
            HStack{
                TextField("Area", text: $course.area)
                TextField("Course Number", value: $course.courseNumber, formatter: NumberFormatter())
            }
            HStack{
                TextField("Quarter", text: $course.quarter)
                TextField("Year", value: $course.year, formatter: NumberFormatter())
            }
        }
        .environmentObject(student)
        .environmentObject(course)
    }
}

class Student: ObservableObject{
    @Published var first: String = "Jane"
    @Published var last: String = "Doe"
}

class Course: ObservableObject{
    @Published var year: Int = 2023
    @Published var quarter: String = "Fall"
    @Published var area: String = "IT-MOB"
    @Published var courseNumber: Int = 382
    @Published var courseTitle: String = "iOS App Development II"
}
