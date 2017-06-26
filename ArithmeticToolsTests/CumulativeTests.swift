//
//  CumulativeTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 12/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
import Collections
import ArithmeticTools

class CumulativeTests: XCTestCase {

    func testIntArrayCumulative() {
        let array = [1,2,3]
        XCTAssertEqual(array.accumulatingRight, [0,1,3])
    }

    func testFloatArrayCumulative() {

        let array = [1.1, 2.2, 3.3]
        let expected = [0, 1.1, 3.3]

        zip(array.accumulatingRight, expected).forEach { actual, expected in
            XCTAssertEqualWithAccuracy(actual, expected, accuracy: 0.000001)
        }
    }
}
