//
//  Home.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject var playData: PlayData
    @State private var selectedPlay: PlayModel?
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedPlay) {
                ForEach(playData.plays) { play in
                    Text(play.name)
                        .tag(play)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Plays:")
            .toolbar {
                Button {
                    // Action for creating a new play
                } label: {
                    Label("Create Play", systemImage: "plus.circle.fill")
                }
            }
        } detail: {
            if let play = selectedPlay {
                PlayView(name: play.name)
            } else {
                Text("Select a Play")
            }
        }
    }
}

#Preview {
    HomeScreenView()
        .environmentObject(PlayData())
}
