//
//  PlayModel.swift
//  Play Maker
//
//  Created by Clay Morton on 12/12/24.
//

import Foundation
import SwiftUI

class PlayModel: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var paths: [any Shape] = []
    
    init(name: String) {
        self.name = name
    }

    // Hashable Conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id) // Use the unique identifier for hashing
    }

    static func == (lhs: PlayModel, rhs: PlayModel) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}

