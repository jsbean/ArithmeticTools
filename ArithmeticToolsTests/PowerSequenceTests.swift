//
//  PowerSequenceTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 3/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
@testable import ArithmeticTools

class PowerSequenceTests: XCTestCase {

    func testforLoop() {
        var array: [Float] = []
        for p in PowerSequence(min: Float(1.0), max: Float(64.0)) { array.append(p) }
        XCTAssertEqual(array, [1.0, 2.0, 4.0, 8.0, 16.0, 32.0, 64.0])
    }
    
    func testFilter() {
        let powerSequence = PowerSequence(min: 1, max: 128)
        let filtered = powerSequence.filter { $0 >= 4 && $0 <= 32 }
        XCTAssertEqual(filtered, [4,8,16,32])
    }
    
    func testNon2Base() {
        let powerSequence = PowerSequence(min: 3, max: 24)
        let mapped = powerSequence.map { $0 }
        XCTAssertEqual(mapped, [3,6,12,24])
    }
}
