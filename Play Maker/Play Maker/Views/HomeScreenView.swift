//
//  Home.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationSplitView {
            List {
                
            }
            .listStyle(.inset)
                .navigationTitle("Plays:")
                .toolbar {
                    Button {
                        //create play button goes here
                    } label: {
                        Label("create play", systemImage: "plus.circle.fill")
                    }
                }
        } detail: {
            Text("Select a Play")
        }
        
    }
}

