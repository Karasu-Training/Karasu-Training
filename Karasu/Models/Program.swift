//
//  Program.swift
//  Karasu
//
//  Created by Ryan Volkert on 8/10/24.
//

import Foundation
import SwiftData

@Model
class Program: Identifiable {
    let id: UUID
    @Attribute(.unique) var name: String
    @Relationship(deleteRule: .cascade) var blocks = [ProgramBlock]()
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}

@Model
class ProgramBlock: AssociationModel {
    let programId: UUID
    let blockId: UUID
    var index: Int = 0
    
    @Relationship(inverse: \Program.blocks) var program: Program
    var block: Block
    
    init(program: Program, block: Block) {
        self.program = program
        programId = program.id
        
        self.block = block
        blockId = block.id
    }
}
