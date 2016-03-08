//
//  IsDividableTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 3/7/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
@testable import ArithmeticTools

class IsDivisibleTests: XCTestCase {

    func testIntIsDivisibleByFalsePrime() {
        XCTAssertFalse(17.isDivisibleBy(3))
    }
    
    func testIntIsDivisibleByFalse() {
        XCTAssertFalse(9.isDivisibleBy(4))
    }
    
    func testIntIsDivisibleByTrue() {
        XCTAssert(42.isDivisibleBy(21))
    }
}
