//
//  Block.swift
//  Karasu
//
//  Created by Ryan Volkert on 8/10/24.
//

import Foundation
import SwiftData

@Model
class Block: Identifiable {
    let id: UUID
    var name: String?
    
    var daysPerWeek: Int
    var weeks: Int
    var days: Int {
        weeks * daysPerWeek
    }
    
    @Relationship(deleteRule: .cascade) var workouts = [BlockWorkout]()
    
    init(id: UUID = UUID(), name: String? = nil, daysPerWeek: Int = 0, weeks: Int = 0) {
        self.id = id
        self.name = name
        self.daysPerWeek = daysPerWeek
        self.weeks = weeks
    }
}

@Model
class BlockWorkout: AssociationModel {
    let blockId: UUID
    let workoutId: UUID
    var index: Int = 0
    
    @Relationship(inverse: \Block.workouts) var block: Block
    var workout: Workout
    
    init(block: Block, workout: Workout) {
        self.block = block
        blockId = block.id
        
        self.workout = workout
        workoutId = workout.id
    }
}
