//
//  RationalTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 1/2/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import XCTest
import ArithmeticTools

class RationalTests: XCTestCase {

    struct R: Rational {
        
        var numerator: Int
        var denominator: Int

        init(_ numerator: Int, _ denominator: Int) {
            
            guard denominator != 0 else {
                fatalError("Cannot have Rational with denominator of 0")
            }
            
            self.numerator = numerator
            self.denominator = denominator
        }
    }
    
    func testInit() {
        _ = R(1,1)
    }
    
    func testFloatValueOne() {
        let r = R(1,1)
        XCTAssertEqual(r.floatValue, 1)
    }
    
    func testFloatValueDecimal() {
        let r = R(1,3)
        XCTAssertEqual(r.floatValue, 1/3)
    }
    
    func testFloatValueNegative() {
        let r = R(-1,5)
        XCTAssertEqual(r.floatValue, -(1/5))
    }
    
    func testInverseNil() {
        let r = R(0,1)
        XCTAssertNil(r.inverse)
    }
    
    func testInverse() {
        let r = R(1,13)
        XCTAssertEqual(r.inverse!, R(13,1))
    }
    
    func testInverseNegative() {
        let r = R(1,-13)
        XCTAssertEqual(r.inverse!, R(-13,1))
    }
    
    func testComparable() {
        let a = R(1,2)
        let b = R(2,3)
        XCTAssert(a < b)
        XCTAssert(b > a)
    }
    
    func testHashValueEqual() {
        let a = R(1,2)
        let b = R(3,6)
        XCTAssertEqual(a.hashValue, b.hashValue)
    }
    
    func testHashValueNotEqual() {
        let a = R(1,13)
        let b = R(11,10948)
        XCTAssertNotEqual(a.hashValue, b.hashValue)
    }
    
    func testRespellWithNumeratorEqualToSelfValid() {
        let original = R(1,13)
        let new = original.with(numerator: 1)!
        XCTAssertEqual(new.numerator, 1)
        XCTAssertEqual(new.denominator, 13)
    }
    
    func testRespellWithNumeratorGreaterThanValid() {
        let original = R(1,13)
        let new = original.with(numerator: 3)!
        XCTAssertEqual(new.numerator, 3)
        XCTAssertEqual(new.denominator, 39)
    }
    
    func testRespellWithNumeratorLessThanValid() {
        let original = R(5,15)
        let new = original.with(numerator: 1)!
        XCTAssertEqual(new.numerator, 1)
        XCTAssertEqual(new.denominator, 3)
    }
    
    func testRespellWithDenominatorEqualToSelfValid() {
        let original = R(1,13)
        let new = original.with(denominator: 13)!
        XCTAssertEqual(new.numerator, 1)
        XCTAssertEqual(new.denominator, 13)
    }
    
    func testRespellWithDenominatorLessThanValid() {
        let original = R(5,10)
        let new = original.with(denominator: 6)!
        XCTAssertEqual(new.numerator, 3)
        XCTAssertEqual(new.denominator, 6)
    }
    
    func testRespellWithDenominatorGreaterThanValid() {
        let original = R(3,12)
        let new = original.with(denominator: 48)!
        XCTAssertEqual(new.numerator, 12)
        XCTAssertEqual(new.denominator, 48)
    }
    
    func testRespellWithDenominatorLessThanNil() {
        let original = R(3,7)
        XCTAssertNil(original.with(denominator: 6))
    }
    
    func testRespellWithDenominatorGreaterThanNil() {
        let original = R(3,7)
        XCTAssertNil(original.with(denominator: 8))
    }
}
