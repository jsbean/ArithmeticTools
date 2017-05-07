//
//  ScaleTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 5/7/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import XCTest
import ArithmeticTools

class ScaleTests: XCTestCase {
    
    func testFloatEqualsSelfInEquivalentRanges() {
        let range: ClosedRange<Float> = 0...1
        let value: Float = 0.5
        XCTAssertEqual(value.scaled(from: range, to: range), value)
    }
    
    func testFloatScaled() {
        let sourceRange: ClosedRange<Float> = 0...1
        let destinationRange: ClosedRange<Float> = 0...100
        let value: Float = 0.5
        XCTAssertEqual(value.scaled(from: sourceRange, to: destinationRange), 50)
    }
}
