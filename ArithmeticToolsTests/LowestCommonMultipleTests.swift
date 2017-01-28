//
//  LowestCommonMultipleTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 1/28/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import XCTest
import ArithmeticTools

class LowestCommonMultipleTests: XCTestCase {
    
    func testLowestCommonMultipleEqual() {
        let a = 5
        let b = 5
        XCTAssertEqual(lcm(a,b), 5)
    }
    
    func testLowestCommonMultipleNotEqualAlreadySimplified() {
        let a = 3
        let b = 17
        XCTAssertEqual(lcm(a,b), 3 * 17)
    }
    
    func testLowestCommonMultipleNotEqualNotSimplified() {
        let a = 6
        let b = 4
        XCTAssertEqual(lcm(a,b), 12)
    }
}
