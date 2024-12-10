//
//  CourtObject.swift
//  Play Maker
//
//  Created by Clay Morton on 12/9/24.
//

import Foundation
import SwiftUI

// Represents an object (X, O, or Line) on the basketball court.
struct CourtObject: Identifiable, Codable {
    enum ObjectType: String, Codable {
        case x, o, line
    }
    
    var id: UUID
    var type: ObjectType
    var position: CGPoint
    var lineDirection: CGPoint? // Only applicable for Line type

    // Custom Decodable initializer to decode the position
    enum CodingKeys: String, CodingKey {
        case id, type, position, lineDirection
    }

    // Custom struct for decodable CGPoint
    struct DecodablePoint: Codable {
        var x: CGFloat
        var y: CGFloat
    }

    // Custom init to convert to and from the custom `DecodablePoint`
    init(id: UUID, type: ObjectType, position: CGPoint, lineDirection: CGPoint? = nil) {
        self.id = id
        self.type = type
        self.position = position
        self.lineDirection = lineDirection
    }

    // Decodable initializer
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.type = try container.decode(ObjectType.self, forKey: .type)

        // Decode position as DecodablePoint
        let positionPoint = try container.decode(DecodablePoint.self, forKey: .position)
        self.position = CGPoint(x: positionPoint.x, y: positionPoint.y)

        // Decode lineDirection as DecodablePoint if it exists
        if let direction = try? container.decode(DecodablePoint.self, forKey: .lineDirection) {
            self.lineDirection = CGPoint(x: direction.x, y: direction.y)
        } else {
            self.lineDirection = nil
        }
    }

    // Encode method to convert back to the encodable form
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)
        
        // Encode position as DecodablePoint
        let positionPoint = DecodablePoint(x: position.x, y: position.y)
        try container.encode(positionPoint, forKey: .position)
        
        // Encode lineDirection as DecodablePoint if it exists
        if let direction = lineDirection {
            let lineDirectionPoint = DecodablePoint(x: direction.x, y: direction.y)
            try container.encode(lineDirectionPoint, forKey: .lineDirection)
        }
    }
}
