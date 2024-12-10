//
//  PersistenceManager.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import Foundation

class PersistenceManager {
    static let shared = PersistenceManager()
    private let directoryURL: URL

    private init() {
        // Set up the directory for saving files
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        directoryURL = documentsURL.appendingPathComponent("saved")
        try? fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true)
    }

    func savePlay(play: PlayData) {
        let fileURL = directoryURL.appendingPathComponent("\(play.name).json")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(play)
            try data.write(to: fileURL)
        } catch {
            print("Error saving play: \(error)")
        }
    }

    func deletePlay(name: String) {
        let fileURL = directoryURL.appendingPathComponent("\(name).json")
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(at: fileURL)
        } catch {
            print("Error deleting play: \(error)")
        }
    }

    func listPlays() -> [String] {
        let fileManager = FileManager.default
        do {
            let files = try fileManager.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil)
            return files.map { $0.deletingPathExtension().lastPathComponent }
        } catch {
            print("Error listing plays: \(error)")
            return []
        }
    }

    // New method to load a play by name
    func loadPlay(name: String) -> PlayData? {
        let fileURL = directoryURL.appendingPathComponent("\(name).json")
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL)
            let play = try decoder.decode(PlayData.self, from: data)
            return play
        } catch {
            print("Error loading play: \(error)")
            return nil
        }
    }
}

