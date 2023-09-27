//
//  StateAndBinding.swift
//  ProIPhone_Ch07_SharingDataBetweenStructures
//
//  Created by Mike Panitz on 9/26/23.
//

import SwiftUI
struct StateAndBindingView: View {
    @State private var message = ""
    var body: some View {
        VStack {
            Text("State and Binding")
                .font(.largeTitle)
            Spacer()
            Text("Hello, \(message)")
                .padding(50)
                .background(Color.yellow)
                .cornerRadius(20)
            Spacer()
            DisplayTextField(newVariable: $message)
                .padding(50)
                .background(Color.yellow)
                .cornerRadius(20)
            Spacer()
        }
        .padding(20)
    }
}
struct StateAndBindingView_Previews: PreviewProvider {
    static var previews: some View {
        StateAndBindingView()
    }
}
