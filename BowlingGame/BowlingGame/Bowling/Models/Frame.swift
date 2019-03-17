//
//  Frame.swift
//  BowlingGame
//

import Foundation

enum TypeFrame {
    case strike
    case spare
    case notAllKnocked
}

struct Frame {
    var tries: [Int]
    
    func type() -> TypeFrame {
        if tries.count == 1 {
            if tries[0] < 10 {
                return .notAllKnocked
            } else {
                return .strike
            }
        } else {
            let sum = tries[0] + tries[1]
            if sum == 10 {
                return .spare
            } else {
                return .notAllKnocked
            }
        }
    }
    
    func sum() -> Int {
        var sum = 0
        for t in tries {
            sum += t
        }
        return sum
    }
}
