//
//  Line.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import SwiftUI

struct PlayLine: Identifiable, Codable {
    var id: UUID = UUID()
    var start: CGPoint
    var end: CGPoint
}
