//
//  Home.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import SwiftUI

struct HomeScreenView: View {
    @Binding var plays: [String]
    var onSelectPlay: (String) -> Void
    var onCreatePlay: () -> Void

    var body: some View {
        VStack {
            HStack {
                Text("Plays:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 20)

                Spacer()

                Button(action: {
                    onCreatePlay()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding(.trailing, 20)
                }
            }
            .padding()

            Divider()

            List {
                if plays.isEmpty {
                    Text("You don't have any plays yet!")
                        .font(.headline)
                        .foregroundColor(.gray)
                } else {
                    ForEach(plays, id: \.self) { play in
                        Button(action: {
                            onSelectPlay(play)
                        }) {
                            Text(play)
                                .font(.title2)
                                .foregroundColor(.primary)
                        }
                    }
                    .onDelete(perform: deletePlay)
                }
            }
        }
        .navigationTitle("Basketball Plays")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white)
    }

    private func deletePlay(at offsets: IndexSet) {
        for index in offsets {
            let playToDelete = plays[index]
            PersistenceManager.shared.deletePlay(name: playToDelete)  // Corrected argument label
        }
        loadPlays()
    }

    private func loadPlays() {
        plays = PersistenceManager.shared.listPlays()
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeScreenView(
                plays: .constant([]),
                onSelectPlay: { _ in },
                onCreatePlay: {}
            )
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}

