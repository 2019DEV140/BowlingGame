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
        var frames = [Frame]()
        var previousRoll: Int? = nil;
        
        for roll in rolls {
            if roll == 10 {
                let frame = Frame.init(tries: [roll])
                frames.append(frame)
            } else {
                if previousRoll == nil {
                    previousRoll = roll
                } else {
                    let frame = Frame.init(tries: [previousRoll!, roll])
                    frames.append(frame)
                    previousRoll = nil
                }
            }
        }
        
        if previousRoll != nil {
            let frame = Frame.init(tries: [previousRoll!])
            frames.append(frame)
        }
        
        return frames
    }
    
    func score() -> Int {
        
    }
}
