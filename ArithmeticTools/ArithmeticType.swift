//
//  ArithmeticType.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/16/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public protocol ArithmeticType: Comparable, IntegerLiteralConvertible {
    
    static var zero: Self { get }
    static var one: Self { get }
    
    static var max: Self { get }
    static var min: Self { get }
    
    static func random(min min: Self, max: Self) -> Self

    static func + (augend: Self, addend: Self) -> Self
    static func - (minuend: Self, subtrahend: Self) -> Self
    static func * (multiplicand: Self, multiplier: Self) -> Self
    static func / (dividend: Self, divisor: Self) -> Self
    static func mod (dividend: Self, _ modulus: Self) -> Self
    
    var isPrime: Bool { get }
    var isEven: Bool { get }
    var isOdd: Bool { get }
    
    func format(f: String) -> String
}

extension Int: ArithmeticType {
        
    public static var zero: Int { return 0 }
    public static var one: Int { return 1 }
    
    public static func mod(dividend: Int, _ modulus: Int) -> Int {
        let result = dividend % modulus
        return result < 0 ? result + modulus : result
    }
    
    // default: [0, 2^32]
    public static func random(min min: Int = 0, var max: Int = Int.max) -> Int {
        max = max >= Int(UInt32.max / 2) ? Int(UInt32.max / 2) : max + 1
        let range = max - min
        return Int(arc4random_uniform(UInt32(range))) + min
    }
    
    public var isPrime: Bool {
        if self <= 1 { return false }
        if self <= 3 { return true }
        var i = 2
        while i * i <= self {
            if self % i == 0 { return false }
            i = i + 1
        }
        return true
    }
    
    public var isEven: Bool { return self % 2 == 0 }
    public var isOdd: Bool { return self % 2 != 0 }
    
    public func format(f: String) -> String { return String(format(f), self) }
}

extension Int8: ArithmeticType {
    
    public static var zero: Int8 { return 0 }
    public static var one: Int8 { return 1 }
    
    public static func mod(dividend: Int8, _ modulus: Int8) -> Int8 {
        let result = dividend % modulus
        return result < 0 ? result + modulus : result
    }
    
    public static func random(min min: Int8 = Int8.min, max: Int8 = Int8.max) -> Int8 {
        return 0
    }
    
    public var isPrime: Bool { return Int(self).isPrime }
    public var isEven: Bool { return Int(self).isEven }
    public var isOdd: Bool { return Int(self).isOdd }
    

    
    public func format(f: String) -> String { return String(format(f), self) }
}

extension UInt8: ArithmeticType {
    
    public static var zero: UInt8 { return 0 }
    public static var one: UInt8 { return 1 }
    
    public static func mod(dividend: UInt8, _ modulus: UInt8) -> UInt8 {
        let result = dividend % modulus
        return result < 0 ? result + modulus : result
    }
    
    public static func random(min min: UInt8 = UInt8.min, max: UInt8 = UInt8.max) -> UInt8 {
        return 0
    }
    
    public var isPrime: Bool { return Int(self).isPrime }
    public var isEven: Bool { return Int(self).isEven }
    public var isOdd: Bool { return Int(self).isOdd }
    

    
    public func format(f: String) -> String { return String(format(f), self) }
}

extension Int16: ArithmeticType {
    
    public static var zero: Int16 { return 0 }
    public static var one: Int16 { return 1 }
    
    public static func mod(dividend: Int16, _ modulus: Int16) -> Int16 {
        let result = dividend % modulus
        return result < 0 ? result + modulus : result
    }
    
    public static func random(min min: Int16 = Int16.min, max: Int16 = Int16.max) -> Int16 {
        return 0
    }
    
    public var isPrime: Bool { return Int(self).isPrime }
    public var isEven: Bool { return Int(self).isEven }
    public var isOdd: Bool { return Int(self).isOdd }
    
    public func format(f: String) -> String { return String(format(f), self) }
}

extension UInt16: ArithmeticType {
    
    public static var zero: UInt16 { return 0 }
    public static var one: UInt16 { return 1 }
    
    public static func mod(dividend: UInt16, _ modulus: UInt16) -> UInt16 {
        let result = dividend % modulus
        return result < 0 ? result + modulus : result
    }
    
    public static func random(min min: UInt16 = UInt16.min, max: UInt16 = UInt16.max) -> UInt16
    {
        return 0
    }
    
    public var isPrime: Bool { return Int(self).isPrime }
    public var isEven: Bool { return Int(self).isEven }
    public var isOdd: Bool { return Int(self).isOdd }
    
    public func format(f: String) -> String { return String(format(f), self) }
}

extension Int32: ArithmeticType {
    
    public static var zero: Int32 { return 0 }
    public static var one: Int32 { return 1 }
    
    public static func mod(dividend: Int32, _ modulus: Int32) -> Int32 {
        let result = dividend % modulus
        return result < 0 ? result + modulus : result
    }
    
    public static func random(min min: Int32 = Int32.min, max: Int32 = Int32.max) -> Int32 {
        return 0
    }
    
    public var isPrime: Bool { return Int(self).isPrime }
    public var isEven: Bool { return Int(self).isEven }
    public var isOdd: Bool { return Int(self).isOdd }
    
    public func format(f: String) -> String { return String(format(f), self) }
}


extension UInt32: ArithmeticType {
    
    public static var zero: UInt32 { return 0 }
    public static var one: UInt32 { return 1 }
    
    public static func mod(dividend: UInt32, _ modulus: UInt32) -> UInt32 {
        let result = dividend % modulus
        return result < 0 ? result + modulus : result
    }
    
    public static func random(min min: UInt32 = UInt32.min, max: UInt32 = UInt32.max) -> UInt32
    {
        return 0
    }
    
    public var isPrime: Bool { return Int(self).isPrime }
    public var isEven: Bool { return Int(self).isEven }
    public var isOdd: Bool { return Int(self).isOdd }
    

    
    public func format(f: String) -> String { return String(format(f), self) }
}

extension Int64: ArithmeticType {
    
    public static var zero: Int64 { return 0 }
    public static var one: Int64 { return 1 }
    
    public static func mod(dividend: Int64, _ modulus: Int64) -> Int64 {
        let result = dividend % modulus
        return result < 0 ? result + modulus : result
    }
    
    public static func random(min min: Int64 = Int64.min, max: Int64 = Int64.max) -> Int64 {
        return 0
    }
    
    public var isPrime: Bool { return Int(self).isPrime }
    public var isEven: Bool { return Int(self).isEven }
    public var isOdd: Bool { return Int(self).isOdd }
    
    public func format(f: String) -> String { return String(format(f), self) }
}

extension UInt64: ArithmeticType {
    
    public static var zero: UInt64 { return 0 }
    public static var one: UInt64 { return 1 }
    
    public static func mod(dividend: UInt64, _ modulus: UInt64) -> UInt64 {
        let result = dividend % modulus
        return result < 0 ? result + modulus : result
    }
    
    public static func random(min min: UInt64 = UInt64.min, max: UInt64 = UInt64.max) -> UInt64
    {
        return 0
    }
    
    public var isPrime: Bool { return Int(self).isPrime }
    public var isEven: Bool { return Int(self).isEven }
    public var isOdd: Bool { return Int(self).isOdd }
    
    public func format(f: String) -> String { return String(format(f), self) }
}

extension Float: ArithmeticType {
    
    public static var zero: Float { return 0 }
    public static var one: Float { return 1 }
    
    public static var max: Float { return FLT_MAX }
    public static var min: Float { return FLT_MIN }
    
    public static func mod(dividend: Float, _ modulus: Float) -> Float {
        let result = dividend % modulus
        return result < 0 ? result + modulus : result
    }
    
    public static func random(min min: Float = 0.0, max: Float = 1.0) -> Float {
        let range = max - min
        return ((Float(arc4random())) / Float(UINT32_MAX) * range) + min
    }
    
    public var isPrime: Bool { return self % 1 != 0 ? true : Int(self).isPrime }
    public var isEven: Bool { return self % 1 != 0 ? false : Int(self).isEven }
    public var isOdd: Bool { return self % 1 != 0 ? false : Int(self).isOdd }
    
    public func format(f: String) -> String { return String(format(f), self) }
}

extension Double: ArithmeticType {
    
    public static var zero: Double { return 0 }
    public static var one: Double { return 1 }
    
    public static var max: Double { return DBL_MAX }
    public static var min: Double { return DBL_MIN }
    
    public static func mod(dividend: Double, _ modulus: Double) -> Double {
        let result = dividend % modulus
        return result < 0 ? result + modulus : result
    }
    
    public static func random(min min: Double = Double.min, max: Double = Double.max) -> Double
    {
        return 0
    }

    public var isPrime: Bool { return self % 1 != 0 ? true : Int(self).isPrime }
    public var isEven: Bool { return self % 1 != 0 ? false : Int(self).isEven }
    public var isOdd: Bool { return self % 1 != 0 ? false : Int(self).isOdd }
    
    public func format(f: String) -> String { return String(format(f), self) }
}

