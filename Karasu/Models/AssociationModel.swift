//
//  AssociationModel.swift
//  Karasu
//
//  Created by Ryan Volkert on 8/10/24.
//

import Foundation
import SwiftData

protocol AssociationModel {
    var index: Int { get set }
}

extension Array where Element: AssociationModel {
    func sortedByIndex() -> [Element] {
        return sorted(by: { $0.index < $1.index })
    }
    
    mutating func add(_ element: Element, at index: Int? = nil) {
        var element = element
        
        if let i = index {
            element.index = i
            self.insert(element, at: i)
            self.updateIndices(from: i)
        } else {
            element.index = self.count
            self.append(element)
        }
    }
    
    mutating func remove(at index: Int) {
        self.removeAll(where: { $0.index == index }) // should only remove one
        self.updateIndices(from: index)
    }
    
    mutating func remove(_ element: Element) {
        remove(at: element.index)
    }
    
    mutating func updateIndices(from index: Int) {
        self = self.sortedByIndex()
        
        for i in index..<count {
            self[i].index = i
        }
    }
}
