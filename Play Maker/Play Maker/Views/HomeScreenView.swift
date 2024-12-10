//
//  Home.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import SwiftUI

struct HomeScreenView: View {
    @Binding var plays: [String] // List of play names
    var onSelectPlay: (String) -> Void // Callback for selecting an existing play
    var onCreatePlay: () -> Void // Callback for creating a new play

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Button(action: {
                    onCreatePlay() // Trigger create new play action
                }) {
                    HStack {
                        Image(systemName: "plus.circle")
                        Text("Create New Play")
                    }
                    .padding(.horizontal)
                    .font(.title2)
                }
            }
            .padding(.top)

            Text("Plays:")
                .font(.largeTitle)
                .padding(.leading)

            if plays.isEmpty {
                Text("You don't have any plays yet!")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List {
                    ForEach(plays, id: \.self) { play in
                        Button(action: {
                            onSelectPlay(play) // Trigger selection of a specific play
                        }) {
                            Text(play)
                                .font(.title3)
                        }
                    }
                    .onDelete(perform: deletePlay)
                }
                .listStyle(InsetGroupedListStyle())
            }

            Spacer()
        }
        .padding()
    }

    private func deletePlay(at offsets: IndexSet) {
        // Use the offsets to remove plays and handle persistence
        plays.remove(atOffsets: offsets)
        PersistenceManager.shared.deletePlay(atOffsets: offsets)
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    @State static var samplePlays = ["Play 1", "Play 2", "Play 3"]

    static var previews: some View {
        HomeScreenView(
            plays: $samplePlays,
            onSelectPlay: { _ in },
            onCreatePlay: {}
        )
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
