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
        var floatValue: Float { fatalError() }
        var inverse: R { fatalError() }
        var reduced: R { fatalError() }
        
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
    
    
}

