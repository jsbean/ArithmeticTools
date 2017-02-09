//
//  InvertibleOptionSetTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/9/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import XCTest
import ArithmeticTools

class InvertibleOptionSetTests: XCTestCase {
    
    struct InvertibleSet: InvertibleOptionSet {
        
        static let a = InvertibleSet(rawValue: 1 << 0)
        static let b = InvertibleSet(rawValue: 1 << 1)
        static let c = InvertibleSet(rawValue: 1 << 2)
        static let d = InvertibleSet(rawValue: 1 << 3)
        
        var optionsCount: Int {
            return 4
        }
        
        var rawValue: Int

        init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
    
    func testAInverseOfD() {
        
        let a = InvertibleSet.a
        let d = InvertibleSet.d
        XCTAssertEqual(a.inverse, d)
    }
}
