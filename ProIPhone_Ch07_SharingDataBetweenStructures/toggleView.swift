//
//  toggleView.swift
//  ProIPhone_Ch07_SharingDataBetweenStructures
//
//  Created by Student Account on 10/10/23.
//

import SwiftUI

struct toggleView: View {
    @Binding var mode: Bool
    var body: some View {
        Toggle("Dark Mode", isOn: $mode)
    }
}

#Preview {
    toggleView(mode: .constant(false))
}
