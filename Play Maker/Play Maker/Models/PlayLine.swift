//
//  Line.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import SwiftUI

struct PlayLine: Identifiable, Codable {
    var id: UUID // Remove the default value
    var start: CGPoint
    var end: CGPoint
    var arrow: Bool

    // Custom initializer to provide a default `id` if not decoded
    init(id: UUID = UUID(), start: CGPoint, end: CGPoint, arrow: Bool) {
        self.id = id
        self.start = start
        self.end = end
        self.arrow = arrow
    }
}
