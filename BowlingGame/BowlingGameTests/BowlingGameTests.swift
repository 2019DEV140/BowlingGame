//
//  BowlingGameTests.swift
//  BowlingGameTests
//

import Quick
import Nimble

@testable import BowlingGame

class FrameSpec: QuickSpec {
    override func spec() {
        describe("A Frame") {
            var aFrame: Frame!
            
            describe("all the pin are knocked", closure: {
                context("in 1 try", {
                    beforeEach {
                        aFrame = Frame(tries: [10])
                    }
                    it("so it's a strike", closure: {
                        expect(aFrame.tries.count).to(equal(1))
                        expect(aFrame.tries[0]).to(equal(10))
                        expect(aFrame.type()).to(equal(.strike))
                    })
                })
                
                context("in 2 tries", {
                    beforeEach {
                        aFrame = Frame(tries: [9, 1])
                    }
                    it("so it's a spare", closure: {
                        expect(aFrame.tries.count).to(equal(2))
                        expect(aFrame.tries[0] + aFrame.tries[1]).to(equal(10))
                        expect(aFrame.type()).to(equal(.spare))
                    })
                })
            })
            
            context("not all the pin are knocked") {
                context("") {
                    beforeEach {
                        aFrame = Frame(tries: [8, 1])
                    }
                    it("it is a normal case") {
                        expect(aFrame.tries.count).to(equal(2))
                        expect(aFrame.tries[0] + aFrame.tries[1]).toNot(equal(10))
                        expect(aFrame.type()).to(equal(.notAllKnocked))
                    }
                }
                
                context("") {
                    
                    beforeEach {
                        aFrame = Frame(tries: [8])
                    }
                    
                    it("it is a bonus case") {
                        expect(aFrame.tries.count).to(equal(1))
                        expect(aFrame.tries[0]).toNot(equal(10))
                        expect(aFrame.type()).to(equal(.notAllKnocked))
                    }
                }
            }
        }
    }
}

class LineSpec: QuickSpec {
    override func spec() {
        describe("A line") {
            var aLine: Line!
            
            context("is made of frame") {
                context("Full of strike") {
                    beforeEach {
                        aLine = Line(withRolls: [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
                    }
                    
                    it("it contains 12 rolls so 10 frame + 2 bonuses") {
                        expect(aLine.frames.count).to(equal(12))
                        expect(aLine.frames[0].type()).to(equal(.strike))
                    }
                }
                
                context("Full of spare") {
                    beforeEach {
                        aLine = Line(withRolls: [5, 5,
                                                 5, 5,
                                                 5, 5,
                                                 5, 5,
                                                 5, 5,
                                                 5, 5,
                                                 5, 5,
                                                 5, 5,
                                                 5, 5,
                                                 5, 5, 5])
                    }
                    
                    it("it contains 21 rolls so 10 frame + 1 bonus") {
                        expect(aLine.frames.count).to(equal(11))
                        expect(aLine.frames[0].type()).to(equal(.spare))
                    }
                }
                
                context("Full of 9-0") {
                    beforeEach {
                        aLine = Line(withRolls: [9, 0,
                                                 9, 0,
                                                 9, 0,
                                                 9, 0,
                                                 9, 0,
                                                 9, 0,
                                                 9, 0,
                                                 9, 0,
                                                 9, 0,
                                                 9, 0])
                    }
                    
                    it("it contains 20 rolls so 10 frame") {
                        expect(aLine.frames.count).to(equal(10))
                        expect(aLine.frames[0].type()).to(equal(.notAllKnocked))
                    }
                }
                
                context("A random game") {
                    beforeEach {
                        aLine = Line(withRolls: [5, 5,
                                                 10,
                                                 9, 0,
                                                 5, 5,
                                                 10,
                                                 9, 0,
                                                 5, 5,
                                                 10,
                                                 9, 0,
                                                 5, 5, 10])
                    }
                    
                    it("it contains 21 rolls so 10 frame + 1 bonus") {
                        expect(aLine.frames.count).to(equal(11))
                    }
                }
            }
        }
    }
}
