//
//  ModuloTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 1/8/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import XCTest
import ArithmeticTools

class ModuloTests: XCTestCase {

    func testModInteger() {
        XCTAssertEqual(mod(-1, 3), 2)
    }
    
    func testModFloatingPoint() {
        XCTAssertEqual(mod(15.5, 12), 3.5)
    }
    
    func testModFloatingPointNegative() {
        XCTAssertEqual(mod(-15.5, 12), 8.5)
    }
}
