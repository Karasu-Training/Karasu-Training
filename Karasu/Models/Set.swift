//
//  Set.swift
//  Karasu
//
//  Created by Ryan Volkert on 8/10/24.
//

import Foundation
import SwiftData

@Model
class Set: Identifiable {
    let id: UUID
    let exercise: Exercise
    
    var reps: Int
    var pct: Double
    
    init(id: UUID = UUID(), exercise: Exercise, reps: Int, pct: Double) {
        self.id = id
        self.exercise = exercise
        self.reps = reps
        self.pct = pct
    }
}
