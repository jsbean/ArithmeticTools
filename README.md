# ArithmeticTools

[![Build Status](https://travis-ci.org/dn-m/ArithmeticTools.svg)](https://travis-ci.org/dn-m/ArithmeticTools)

Basic arithmetic types and operations. For iOS and OSX platforms.

## Usage

### ArithmeticType
Unifies [IntegerLiteralConvertible](http://swiftdoc.org/v2.1/protocol/IntegerLiteralConvertible/hierarchy/) types, enabling generic operation upon sequences of numeric values:
- `Int`, `In8`, `UInt8`, `Int16`, `UInt16`, `Int32`, `UInt32`, `Int64`, `UInt64`
- `Float`, `Double`

```Swift
var isPrime: Bool { get }
```

```Swift
var isEven: Bool { get }
```

```Swift
var isOdd: Bool { get }
```

```Swift
func format(f: String) -> String
```

### SequenceType Extensions

```Swift
public var sum: Generator.Element
```

```Swift
public var gcd: Generator.Element?
```

### Array Extensions

```Swift
public var mean: Float
```

```Swift
public var cumulative: [Element]
```

```Swift
public var cumulativeWithValue: [(Element, Element)]
```

### Free functions
```Swift 
public func greatestCommonDivisor<T: ArithmeticType>(a: T, _ b: T) -> T
```

```Swift
greatestCommonDivisor(4,12) // 4
greatestCommonDivisor(6.0, 9.0) // 3.0
```

## Integration

### Carthage
The best way to integrate **ArithmeticTools** into your iOS or OSX project is with [Carthage](https://github.com/Carthage/Carthage).

Follow [these instructions](https://github.com/Carthage/Carthage#installing-carthage) to install Carthage.

1. Add **Arithmetic** to your Cartfile: ```github "dn-m/ArithmeticTools"```
2. Update Carthage from the command line: ```carthage update```
