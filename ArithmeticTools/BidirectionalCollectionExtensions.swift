//
//  BidirectionalCollectionExtensions
//  ArithmeticTools
//
//  Created by James Bean on 2/16/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation
import Collections

extension SignedNumber {
    
    /// - returns: Sum of two `SignedNumber` values.
    public static func + (lhs: Self, rhs: Self) -> Self {
        return lhs - -rhs
    }
}

extension Collection where Iterator.Element: Monoid {
    
    typealias M = Iterator.Element
    
    /// - returns: An array of the values contained herein accumulating the running sum to the
    /// right, start with `.unit`.
    public var accumulatingRight: [Iterator.Element] {
        
        func accumulate(_ array: [M], result: [M], sum: M) -> [M] {
            
            guard let (head, tail) = array.destructured else {
                return result
            }
            
            return accumulate(tail, result: result + [sum], sum: sum + head)
        }
        
        return accumulate(Array(self), result: [], sum: .unit)
    }
    
    public var accumulatingLeft: [Iterator.Element] {
        return reversed().accumulatingRight.reversed()
    }
}

extension BidirectionalCollection where Iterator.Element: SignedNumber {
    
    /**
     Get the closest value in Array to target value.
     
     - parameter target: Value to check for closest component
     
     - returns: Value closest to target is !self.isEmpty. Otherwise nil.
     */
    public func closest(to target: Iterator.Element) -> Iterator.Element? {
        
        guard !self.isEmpty else {
            return nil
        }
        
        var cur = self.first!
        var diff = abs(target - cur)
        for el in self {
            let newDiff = abs(target - el)
            if newDiff < diff {
                diff = newDiff
                cur = el
            }
        }
        
        return cur
    }
}

extension BidirectionalCollection where Iterator.Element: FloatingPoint, IndexDistance == Int {
    
    public typealias F = Iterator.Element
    
    
    /// - returns: Average of all values contained herein, if there are more than 0 elements.
    /// Otherwise, `nil`.
    public var mean: F? {
        
        guard !isEmpty else {
            return nil
        }
        
        return sum / F(count)
    }
}
