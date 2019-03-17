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
        var score = 0
        for i in 0..<10 {
            switch frames[i].type() {
            case .notAllKnocked:
                score += frames[i].sum()
                break;
            case .spare:
                score += frames[i].sum() + frames[i + 1].tries[0]
                break;
            case .strike:
                if frames[i + 1].type() == .strike {
                    score += frames[i].sum() + frames[i + 1].sum() + frames[i + 2].sum()
                } else {
                    score += frames[i].sum() + frames[i + 1].sum()
                }
                break;
            }
        }
        return score
    }
}
