//
//  BitwiseOperationsTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 1/8/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import XCTest
import ArithmeticTools

class BitwiseOperationsTests: XCTestCase {
    
    func testLog2IntPowerOfTwo() {
        let x = 1 << 4
        XCTAssertEqual(log2(powerOfTwo: x), 4)
    }
    
    func testInvertSameZero() {
        
        let powerOfTwo = 1 << 0
        let max = 0
        let result = invert(powerOfTwo: powerOfTwo, within: max)
        let expected = 0
        
        XCTAssertEqual(result, expected)
    }
    
    func testInvert() {

        let powerOfTwo = 1 << 6
        let max = 7
        let result = 1 << invert(powerOfTwo: powerOfTwo, within: max)
        let expected = 1 << 1
        
        XCTAssertEqual(result, expected)
    }
}
