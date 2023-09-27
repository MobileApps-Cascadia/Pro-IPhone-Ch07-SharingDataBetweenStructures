//
//  StateObjectandObservedObject.swift
//  ProIPhone_Ch07_SharingDataBetweenStructures
//
//  Created by Mike Panitz on 9/26/23.
//

import SwiftUI

class AnimalModel: ObservableObject {
    @Published var name: String = ""
    @Published var breed: String = ""
    @Published var age: Double = 0.0
    @Published var weight: Double = 0.0
}

struct StateObjectandObservedObject: View {
    @StateObject var cat = AnimalModel()
    var body: some View {
        VStack {
            Text("StateObject and ObservedObject")
                .font(.largeTitle)
            Spacer()
            VStack {
                Text("Hello, \(cat.name)")
                Text("Breed: \(cat.breed)")
                Text("Age: \(Int(cat.age))")
                Text("Weight: \(cat.weight)")
            }
            .padding(50)
            .background(Color.yellow)
            .cornerRadius(20)
            Spacer()
            DisplayAnimal(creature: cat)
                .padding(50)
                .background(Color.yellow)
                .cornerRadius(20)
            Spacer()
        }.padding()
    }
}
struct StateObjectandObservedObject_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectandObservedObject()
    }
}

struct DisplayAnimal: View {
    @ObservedObject var creature: AnimalModel
    var body: some View {
        VStack {
            HStack {
                Text("Name:")
                TextField("Type a name here", text: $creature.name)
            }
            HStack {
                Text("Breed:")
                TextField("Type a breed here", text: $creature.breed)
            }
            HStack {
                Text("Age:")
                Slider(value: $creature.age, in: 0...20)
            }
            HStack {
                Text("Weight:")
                Slider(value: $creature.weight, in: 0...200)
            }
        }
    }
}
