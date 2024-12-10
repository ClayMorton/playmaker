//
//  PersistenceManager.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import Foundation

class PersistenceManager {
    static let shared = PersistenceManager()

    private let fileManager = FileManager.default
    private let directoryURL: URL

    private init() {
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        directoryURL = documentsURL.appendingPathComponent("saved")

        // Create "saved" directory if it doesn't exist
        if !fileManager.fileExists(atPath: directoryURL.path) {
            try? fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
        }
    }

    func savePlay(named name: String, data: Data) -> Bool {
        let fileURL = directoryURL.appendingPathComponent("\(name).json")
        do {
            try data.write(to: fileURL)
            return true
        } catch {
            print("Failed to save play: \(error.localizedDescription)")
            return false
        }
    }

    func loadPlay(named name: String) -> Data? {
        let fileURL = directoryURL.appendingPathComponent("\(name).json")
        return try? Data(contentsOf: fileURL)
    }

    func deletePlay(named name: String) -> Bool {
        let fileURL = directoryURL.appendingPathComponent("\(name).json")
        do {
            try fileManager.removeItem(at: fileURL)
            return true
        } catch {
            print("Failed to delete play: \(error.localizedDescription)")
            return false
        }
    }

    func deletePlay(atOffsets offsets: IndexSet) {
        let allPlays = listPlays()
        offsets.forEach { index in
            let playName = allPlays[index]
            _ = deletePlay(named: playName)
        }
    }

    func listPlays() -> [String] {
        guard let fileURLs = try? fileManager.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else {
            return []
        }
        return fileURLs
            .filter { $0.pathExtension == "json" }
            .map { $0.deletingPathExtension().lastPathComponent }
    }
}
