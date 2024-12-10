//
//  Tool.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import Foundation

enum PlayTool {
    case x
    case o
    case line
}

extension PlayTool: Equatable {
    static func ==(lhs: PlayTool, rhs: PlayTool) -> Bool {
        switch (lhs, rhs) {
        case (.x, .x), (.o, .o), (.line, .line):
            return true
        default:
            return false
        }
    }
}
