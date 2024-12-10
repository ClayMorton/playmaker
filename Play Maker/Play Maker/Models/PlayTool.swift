//
//  Tool.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import SwiftUI

enum ToolType {
    case x, o, line
}

struct PlayTool: Identifiable, Equatable {
    var id = UUID()
    var name: ToolType
    var icon: String
    var action: () -> Void
    
    static func ==(lhs: PlayTool, rhs: PlayTool) -> Bool {
            return lhs.name == rhs.name && lhs.icon == rhs.icon
    }
}
