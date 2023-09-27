//
//  DisplayTextField.swift
//  ProIPhone_Ch07_SharingDataBetweenStructures
//
//  Created by Mike Panitz on 9/26/23.
//

import SwiftUI

struct DisplayTextField: View {
    @Binding var newVariable: String
    var body: some View {
        HStack {
            Text("Send a greeting:")
            TextField("Type a message here", text: $newVariable)
        }
    }
}

struct DisplayTextField_Previews: PreviewProvider {
    static var previews: some View {
        DisplayTextField(newVariable: .constant(""))
    }
}
