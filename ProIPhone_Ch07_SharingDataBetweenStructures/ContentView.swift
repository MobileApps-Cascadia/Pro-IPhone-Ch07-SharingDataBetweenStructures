import SwiftUI

struct ContentView: View {
    @State private var isDarkMode = false
    @State private var student = Student(firstName: "John", lastName: "Doe")
    @State private var course = Course(year: "2023", quarter: "Q1", area: "IT-MOB", courseNumber: "101", courseTitle: "Introduction to Programming")

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

            // New View with Dark Mode Toggle and Student & Course Information
            DarkModeAndDataView(isDarkMode: $isDarkMode, student: $student, course: $course)
                .tabItem {
                    Image(systemName: "4.circle")
                }
        }
        .tabViewStyle(DefaultTabViewStyle())
        .environment(\.colorScheme, isDarkMode ? .dark : .light)
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
    var area: String
    var courseNumber: String
    var courseTitle: String
}

struct DarkModeAndDataView: View {
    @Binding var isDarkMode: Bool
    @Binding var student: Student
    @Binding var course: Course

    var body: some View {
        VStack {
            Toggle("Dark Mode", isOn: $isDarkMode)
                .padding()

            Text("Student Information:")
                .font(.headline)
            
            // Subcomponent for editing student information
            StudentInfoView(student: $student)

            Text("Course Information:")
                .font(.headline)
            
            // Subcomponent for editing course information
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
            TextField("Area", text: $course.area)
            TextField("Course Number", text: $course.courseNumber)
            TextField("Course Title", text: $course.courseTitle)
        }
    }
}
