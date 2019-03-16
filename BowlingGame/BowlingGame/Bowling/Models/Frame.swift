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
            return .strike
        } else {
            let sum = tries[0] + tries[1]
            if sum == 10 {
                return .spare
            } else {
                return .notAllKnocked
            }
        }
    }
}
