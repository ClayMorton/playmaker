//
//  ContentView.swift
//  Play Maker
//
//  Created by Clay Morton on 12/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var plays: [String] = []
    @State private var selectedPlay: String? = nil

    var body: some View {
        NavigationView {
            HomeScreenView(
                plays: $plays,
                onSelectPlay: { play in
                    selectedPlay = play
                },
                onCreatePlay: {
                    selectedPlay = nil
                }
            )
            .onAppear {
                loadPlays()
            }
            .background(
                NavigationLink(
                    destination: PlayViewWrapper(playName: selectedPlay),
                    isActive: .constant(selectedPlay != nil),
                    label: { EmptyView() }
                )
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func loadPlays() {
        plays = PersistenceManager.shared.listPlays()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
