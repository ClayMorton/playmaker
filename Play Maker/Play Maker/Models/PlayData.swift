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
    
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data


        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }


        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }


        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }

}
