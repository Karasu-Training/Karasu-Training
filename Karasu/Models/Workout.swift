//
//  Workout.swift
//  Karasu
//
//  Created by Ryan Volkert on 8/10/24.
//

import Foundation
import SwiftData

@Model
class Workout: Identifiable {
    let id: UUID
    @Relationship(deleteRule: .cascade) var sets = [WorkoutSet]()
    
    init(id: UUID = UUID()) {
        self.id = id
    }
}

@Model
class WorkoutSet: AssociationModel {
    let workoutId: UUID
    let setId: UUID
    var index: Int = 0
    
    var complete: Bool = false
    
    @Relationship(inverse: \Workout.sets) var workout: Workout
    var set: Set
    
    init(workout: Workout, set: Set) {
        self.workout = workout
        workoutId = workout.id
        
        self.set = set
        setId = set.id
    }
}
