//
//  IsDividableTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 3/7/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
@testable import ArithmeticTools

class IsDividableTests: XCTestCase {

    func testIntIsDividableByFalsePrime() {
        XCTAssertFalse(17.isDivisibleBy(3))
    }
    
    func testIntIsDividableByFalse() {
        XCTAssertFalse(9.isDivisibleBy(4))
    }
    
    func testIntIsDividableByTrue() {
        XCTAssert(42.isDivisibleBy(21))
    }
}
