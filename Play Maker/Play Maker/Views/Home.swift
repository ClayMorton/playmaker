//
//  Home.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import SwiftUI

import SwiftUI

struct Home: View {
    @State private var plays: [String] = [] // Array to hold the list of plays
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                // Header with "Plays:" text and + button
                HStack {
                    Text("Plays:")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        // Action to create a new play
                        createNewPlay()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing, 16)
                }
                .padding()
                
                // List of plays or empty state
                if plays.isEmpty {
                    Text("You don't have any plays yet!")
                        .foregroundColor(.gray)
                        .italic()
                        .padding()
                } else {
                    List(plays, id: \.self) { play in
                        Text(play)
                    }
                }
                Spacer()
            }
            .navigationTitle("Home")
            .navigationBarHidden(true) // Hides the default navigation bar
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensures iPad layout looks correct
    }
    
    private func createNewPlay() {
        // This is a placeholder action for creating a new play
        plays.append("New Play \(plays.count + 1)")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .previewInterfaceOrientation(.landscapeLeft) // Ensure landscape preview
    }
}

