//
//  NumberFormattingTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 12/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
import ArithmeticTools

class NumberFormattingTests: XCTestCase {

    func testFormattedIntLeadingZeros() {
        
        let digits = 3
        
        let values = (0..<1000).map {
            value in return value.formatted(digits: digits)
        }
        
        values.forEach { value in
            XCTAssertEqual(value.characters.count, digits)
        }
    }
    
    func testFormattedFloatDigits() {
        
        let digits = 4
        
        let values = stride(from: Float(0.0), to: 0.1, by: 0.001).map {
            value in return value.formatted(digits: digits)
        }
        
        values.forEach { value in
            XCTAssertEqual(value.characters.count, digits + 2)
        }
    }
}
