//
//  Exercise.swift
//  Karasu
//
//  Created by Ryan Volkert on 8/10/24.
//

import Foundation
import SwiftData

@Model
class Exercise: Identifiable, Codable {
    enum CodingKeys: CodingKey {
        case id, name, targets, movementPattern, classification
    }
    
    let id: UUID
    @Attribute(.unique) var name: String
    let targets: [MuscleGroup]
    let movementPattern: MovementPattern
    let classification: Classification
    
    init(id: UUID = UUID(), name: String, movementPattern: MovementPattern, classification: Classification, targets: [MuscleGroup]) {
        self.id = id
        self.name = name
        self.targets = targets
        self.movementPattern = movementPattern
        self.classification = classification
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        targets = try container.decode([MuscleGroup].self, forKey: .targets)
        movementPattern = try container.decode(MovementPattern.self, forKey: .movementPattern)
        classification = try container.decode(Classification.self, forKey: .classification)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(targets, forKey: .targets)
        try container.encode(movementPattern, forKey: .movementPattern)
        try container.encode(classification, forKey: .classification)
    }
}

extension Exercise {
    enum MovementPattern: String, Codable {
        case push, pull, hinge, squat, lunge
    }
    
    enum MuscleGroup: String, Codable {
        case chest
        case triceps
        case deltoids
        case lats
        case biceps
        case traps
        case hamstrings
        case quads
        case core
        case hips
        case calves
        case glutes
        case back
    }
    
    enum Classification: String, Codable {
        case competition, developmental, supplemental
    }
}
