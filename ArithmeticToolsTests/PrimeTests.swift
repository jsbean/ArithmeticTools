//
//  PrimeTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/18/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
@testable import ArithmeticTools

class PrimeTests: XCTestCase {
    
    func testIntIsPrimeTrue() {
        XCTAssertTrue(5.isPrime)
    }
    
    func testIntIsPrimeFalse() {
        XCTAssertFalse(9.isPrime)
    }
}
