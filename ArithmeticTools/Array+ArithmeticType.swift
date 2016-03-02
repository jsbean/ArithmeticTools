//
//  ArrayExtension.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/16/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation
import ArrayTools

extension Array where Element: ArithmeticType {
    
    public var mean: Float? {
        if count == 0 { return nil }
        switch sum {
        case let sum as Int: return Float(sum) / Float(count)
        case let sum as Int8: return Float(sum) / Float(count)
        case let sum as UInt8: return Float(sum) / Float(count)
        case let sum as Int16: return Float(sum) / Float(count)
        case let sum as UInt16: return Float(sum) / Float(count)
        case let sum as Int32: return Float(sum) / Float(count)
        case let sum as UInt32: return Float(sum) / Float(count)
        case let sum as Int64: return Float(sum) / Float(count)
        case let sum as UInt64: return Float(sum) / Float(count)
        case let sum as Float: return sum / Float(count)
        case let sum as Double: return Float(sum) / Float(count)
        default: fatalError("Unable to compute value")
        }
    }
    
    public var cumulative: [Element] {
        func accumulate(array: [Element], result: [Element], sum: Element) -> [Element] {
            guard let (head, tail) = array.destructured else { return result }
            return accumulate(tail, result: result + [sum], sum: sum + head)
        }
        return accumulate(self, result: [], sum: 0)
    }
    
    /// Returns (position, value)
    public var cumulativeWithValue: [(Element, Element)] {
        func accumulate(array: [Element], result: [(Element, Element)], sum: Element)
            -> [(Element, Element)]
        {
            guard let (head, tail) = array.destructured else { return result }
            return accumulate(tail, result: result + [(sum + head, head)], sum: sum + head)
        }
        return accumulate(self, result: [], sum: 0)
    }
    
    public func closestTo(target: Element) -> Element? {
        guard count > 0 else { return nil }
        var cur = self[0]
        var diff = Element.abs(target - cur)
        for el in self {
            let newDiff = Element.abs(target - el)
            if newDiff < diff {
                diff = newDiff
                cur = el
            }
        }
        return cur
    }
}