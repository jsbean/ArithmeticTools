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

    func testMod() {
        XCTAssertEqual(mod(-1, 3), 2)
    }
}
