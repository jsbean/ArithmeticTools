//
//  CumulativeTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 12/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
import ArithmeticTools

class CumulativeTests: XCTestCase {
    
    func testIntArrayCumulative() {
        let array = [1,2,3]
        XCTAssertEqual(array.cumulative, [0,1,3])
    }
    
    func testFloatArrayCumulative() {
        let array = [1.1, 2.2, 3.3]
        let expected = [0, 1.1, 3.3]
        zip(array.cumulative, expected).forEach { actual, expected in
            XCTAssertEqualWithAccuracy(actual, expected, accuracy: 0.000001)
        }
    }
    
    func testIntArrayCumulativeWithValue() {
        let array = [1,2,3]
        let expected = [(0,1), (1,2), (3,3)]
        zip(array.cumulativeWithValue, expected).forEach { actual, expected in
            XCTAssertEqual(actual.0, expected.0)
            XCTAssertEqual(actual.1, expected.1)
        }
    }
}
