//
//  PlayData.swift
//  Play Maker
//
//  Created by Clay Morton on 12/12/24.
//

import Foundation
import Combine

class PlayData: ObservableObject {
    @Published var plays: [PlayModel] = []
    
    init() {
        loadPlays()
    }

    private func loadPlays() {
        // Simulated loading of plays. Replace with real file I/O.
        plays = [
            PlayModel(name: "Play 1"),
            PlayModel(name: "Play 2"),
            PlayModel(name: "Play 3")
        ]
    }
}
