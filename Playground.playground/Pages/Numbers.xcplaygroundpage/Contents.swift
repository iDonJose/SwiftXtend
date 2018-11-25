import SwiftXtend

/*:
 ### `abs`
 Absolute value of a number.
 > Applies to Int, Float, Double, Decimal.
 */

let number = -25
let absoluteValue = number.abs

/*:
 ### `min(_:), max(_:), in(_:)`
 Restricts a value.
 > Applies to UInt, Int, Float, Double, Decimal.
 */

let restictedValue = number.in(10, 15)

/*:
 ### `ceil, floor`
 Rounds to nearest integer.
 > Applies to Float, Double.
 */

let float = Float(6.58)
let ceil = float.ceil
let floor = float.floor


//: < [Summary](Summary) | [Next](@next) >
