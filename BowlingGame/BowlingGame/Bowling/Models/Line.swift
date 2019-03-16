//
//  Line.swift
//  BowlingGame
//

import Foundation

class Line {
    var frames: [Frame]!
    
    init(withRolls rolls: [Int]) {
        self.frames = createFrames(withRolls: rolls)
    }
    
    func createFrames(withRolls rolls: [Int]) -> [Frame] {
        
    }
}
