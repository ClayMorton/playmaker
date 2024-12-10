//
//  PlayData.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import Foundation

struct PlayData: Codable {
    let name: String
    var lines: [PlayLine]
    var xObjects: [CGPoint]
    var oObjects: [CGPoint]
}
