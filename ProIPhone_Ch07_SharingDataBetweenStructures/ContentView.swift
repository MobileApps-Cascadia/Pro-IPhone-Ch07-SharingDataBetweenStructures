//
//  ContentView.swift
//  ProIPhone_Ch07_SharingDataBetweenStructures
//
//  Created by Mike Panitz on 9/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var Darkmode = false
    @State private var student = Student(firstName: "Kenny", lastName: "Luchau")
    @State private var course = Course( year: "2023", quarter: "Q1", field: "IT-MOB", courseNumber: "101", courseTitle: "Intro to swift")
    
    var body: some View {
        TabView {
            RandomBackgroundColor()
                .tabItem {
                    Image(systemName: "1.circle")
                }

            StateAndBindingView()
                .tabItem {
                    Image(systemName: "2.circle")
                }

            StateObjectandObservedObject()
                .tabItem {
                    Image(systemName: "3.circle")
                }
            DarkmodeAndInfo(isDarkMode: $Darkmode, student: $student, course: $course)
                .tabItem {
                    Image(systemName: "4.circle")
                }
        }
        .tabViewStyle(DefaultTabViewStyle())
        .environment(\.colorScheme, Darkmode ? .dark : .light)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Student {
    var firstName: String
    var lastName: String
}

struct Course {
    var year: String
    var quarter: String
    var field: String
    var courseNumber: String
    var courseTitle: String
}

struct DarkmodeAndInfo: View {
    @Binding var isDarkMode: Bool
    @Binding var student: Student
    @Binding var course: Course

    var body: some View {
        VStack {
            Toggle("Dark Mode", isOn: $isDarkMode)
                .padding()

            Text("Student Information:")
                .font(.headline)

            StudentInfoView(student: $student)

            Text("Course Information:")
                .font(.headline)
            CourseInfoView(course: $course)
        }
        .padding()
    }
}

struct StudentInfoView: View {
    @Binding var student: Student

    var body: some View {
        VStack {
            TextField("First Name", text: $student.firstName)
            TextField("Last Name", text: $student.lastName)
        }
    }
}

struct CourseInfoView: View {
    @Binding var course: Course

    var body: some View {
        VStack {
            TextField("Year", text: $course.year)
            TextField("Quarter", text: $course.quarter)
            TextField("Area", text: $course.field)
            TextField("Course Number", text: $course.courseNumber)
            TextField("Course Title", text: $course.courseTitle)
        }
    }
}
