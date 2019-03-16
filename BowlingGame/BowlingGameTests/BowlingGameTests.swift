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
