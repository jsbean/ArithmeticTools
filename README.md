# ArithmeticTools

[![Build Status](https://travis-ci.org/dn-m/ArithmeticTools.svg)](https://travis-ci.org/dn-m/ArithmeticTools)

Basic arithmetic types and operations. For iOS and OSX platforms.

## Usage

### ArithmeticType

The `protocol` **`ArithmeticType`** unifies [IntegerLiteralConvertible](http://swiftdoc.org/v2.1/protocol/IntegerLiteralConvertible/hierarchy/) types:

| IntegerType | FloatingPointType |
| ------------|-------------------|
|`Int`        | `Float`           |
|`In8`        | `Double`          |
|`UInt8`      |                   |
|`Int16`      |                   |
| `UInt16`    |                   |
|`Int32`      |                   |
|`UInt32`     |                   |
|`Int64`      |                   |
|`UInt64`     |                   |

#### Type Variables
| Name | Signature |
-------|-----------|
| **`zero`**| `zero: Bool` |
| **`one`**| `one: Bool` |
| **`min`**| `min: Self` |
| **`max`**| `max: Self` |

#### Type Methods
| Name | Signature |
-------|-----------|
| **`random`**| `random(min min: Self = ..., max: Self = ...) -> ` |

#### Instance Variables
| Name | Signature |
-------|-----------|
|**`isEven`**| `isEven: Bool`|
|**`isOdd`**| `isOdd: Bool` |
|**`isPrime`**| `isPrime: Bool`|
|**`format`**| `format(f: String) -> String` |

### SequenceType Extensions

#### Instance Variables
| Name | Signature |
-------|-----------|
|**`sum`**| `sum: Generator.Element`|
|**`gcd`**| `gcd: Generator.Element?` |

### Array Extensions

#### Instance Variables
| Name | Signature |
-------|-----------|
|**`mean`**|`mean: Float`|  
|**`cumulative`**|`cumulative: [Element]`|
|**`cumulativeWithValue`**|`cumulativeWithValue: [(Element, Element)]`|

### Free functions

| Name | Signature |
-------|-----------|
|**`greatestCommonDivisor`**|`greatestCommonDivisor((a: T, _ b: T) -> T`|

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
