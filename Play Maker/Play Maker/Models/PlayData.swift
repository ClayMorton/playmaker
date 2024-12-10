//
//  PlayData.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import Foundation
import SwiftUI

// PlayData struct will hold the saved play information.
struct PlayData: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String = ""
    var xPositions: [CGPoint] = []
    var oPositions: [CGPoint] = []
    var lines: [PlayLine] = []
    
    // Method to load data from a file
    static func loadFromFile(fileName: String) -> PlayData? {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        if let data = try? Data(contentsOf: fileURL) {
            let decoder = JSONDecoder()
            return try? decoder.decode(PlayData.self, from: data)
        }
        return nil
    }
    
    // Method to save data to a file
    static func saveToFile(play: PlayData, fileName: String) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(play) {
            let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
            try? data.write(to: fileURL)
        }
    }
    
    // Get the directory where play files are stored
    private static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
