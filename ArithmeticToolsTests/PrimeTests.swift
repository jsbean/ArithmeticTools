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
    
    func testIntIsPrime1isFalse() {
        XCTAssertFalse(1.isPrime)
    }
    
    func testIntIsPrime0isFalse() {
        XCTAssertFalse(0.isPrime)
    }
    
    func testIntIsPrimeNegativeIsFalse() {
        XCTAssertFalse(-1.isPrime)
        XCTAssertFalse(-3.isPrime)
        XCTAssertFalse(-9.isPrime)
    }
    
    func testIntIsPrime2isTrue() {
        XCTAssertTrue(2.isPrime)
    }
    
    func testIntIsPrime3isTrue() {
        XCTAssertTrue(3.isPrime)
    }
}
