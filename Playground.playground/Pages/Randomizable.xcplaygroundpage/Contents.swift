import SwiftXtend

/*:
 ### `Randomizable`
 Generates random values.
 > Boolean, UInt, Int conforms to `Randomizable`.
 */

let randomBool = Bool.random
let randomInt = Int.random

/*:
 ### `CRandomizable`
 Gives access to random element or random subset.
 > Array, Set and Dictionary conforms to `CRandomizable``.
 */

let array = ["A", "B", "C", "D", "E", "F", "G"]
let randomElement = array.random!
let randomSubset = array.randomSubset(ofSize: 3)

/*:
 ### `Range.random`
 Gets of random value in a range.
 > Exists on Range, ClosedRange, PartialRangeFrom, PartialRangeUpTo & PartialRangeThrough.
 */

let range = (0...Double(100))
let randomInRange = range.random


//: < [Summary](Summary) | [Next](@next) >
