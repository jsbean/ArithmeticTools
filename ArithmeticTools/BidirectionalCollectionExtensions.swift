//
//  BidirectionalCollectionExtensions
//  ArithmeticTools
//
//  Created by James Bean on 2/16/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation
import ArrayTools

extension SignedNumber {
    
    // FIXME: This should not be necessary! For some reason, only `-` is valid for 
    //        `SignedNumber`.
    public static func + (lhs: Self, rhs: Self) -> Self {
        return lhs - -rhs
    }
}

extension BidirectionalCollection where Iterator.Element: SignedNumber {
    
    public typealias N = Iterator.Element
    
    /**
     Cumulative representation of elements in Array.
     
     >`[1,2,2].cumulative -> [0,1,3]`
     */
    public var cumulative: [N] {
        
        func accumulate(_ array: [N], result: [N], sum: N) -> [N] {
            
            guard let (head, tail) = array.destructured else {
                return result
            }
            
            return accumulate(tail, result: result + [sum], sum: sum + head)
        }
        
        return accumulate(Array(self), result: [], sum: 0)
    }
    
    /**
     Returns (position, value).
     
     >`[1,2,2].cumulativeWithValue -> [(0,1),(1,2),(3,2)]`
     */
    public var cumulativeWithValue: [(N, N)] {
        return Array(zip(cumulative, self))
    }
    
    /**
     Get the closest value in Array to target value.
     
     - parameter target: Value to check for closest component
     
     - returns: Value closest to target is !self.isEmpty. Otherwise nil.
     */
    public func closest(to target: N) -> N? {
        
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
    ///            Otherwise, `nil`.
    public var mean: F? {
        
        guard !isEmpty else {
            return nil
        }
        
        return sum / F(count)
    }
}
