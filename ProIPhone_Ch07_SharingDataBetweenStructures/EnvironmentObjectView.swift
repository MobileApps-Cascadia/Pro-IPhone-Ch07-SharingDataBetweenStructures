//
//  EnvironmentObject.swift
//  ProIPhone_Ch07_SharingDataBetweenStructures
//
//  Created by Mike Panitz on 9/26/23.
//

import SwiftUI

// class AnimalModel: ObservableObject {
// This is the same as the prior example, so we reuse that code

import SwiftUI
struct EnvironmentObjectView: View {
    @StateObject var cat = AnimalModel()
    var body: some View {
        VStack {
            Text("EnvironmentObject Example")
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
            DisplayAnimal_ViaEnvObj()
                .padding(50)
                .background(Color.yellow)
                .cornerRadius(20)
            Spacer()
        }
        .padding()
        .environmentObject(cat)
    }
}

struct DisplayAnimal_ViaEnvObj: View {
    @EnvironmentObject var creature: AnimalModel
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

struct EnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView(cat: AnimalModel())
    }
}
