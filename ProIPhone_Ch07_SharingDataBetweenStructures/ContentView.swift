//
//  ContentView.swift
//  ProIPhone_Ch07_SharingDataBetweenStructures
//
//  Created by Mike Panitz on 9/26/23.
//

import SwiftUI

struct ContentView: View {
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
            EnvironmentObjectView()
                .tabItem {
                    Image(systemName: "4.circle")
                }
            ch07()
                .tabItem{
                    Image(systemName: "5.circle")
                }
        }
        .tabViewStyle(DefaultTabViewStyle())

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
