//
//  RandomBackgroundColor.swift
//  ProIPhone_Ch07_SharingDataBetweenStructures
//
//  Created by Mike Panitz on 9/26/23.
//

import SwiftUI


struct RandomBackgroundColor: View {
    @State private var backgroundColor = Color.white

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Random Background Color")
                    .font(.largeTitle)
                    .padding()

                Button(action: {
                    // Generate a random color
                    let red = Double.random(in: 0...1)
                    let green = Double.random(in: 0...1)
                    let blue = Double.random(in: 0...1)
                    self.backgroundColor = Color(red: red, green: green, blue: blue)
                }) {
                    Text("Change Color")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct RandomBackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        RandomBackgroundColor()
    }
}
