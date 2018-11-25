import SwiftXtend

/*:
 ### `init(number:base:minLength:)`
 Converts a number to a specific base.
 */

let _112InBase2 = String(number: 120, base: 2, minLength: 8)

/*:
 ### `isNotEmpty`
 Checks if a string is not empty.
 */

var string = "shoes"
let isNotEmpty = string.isNotEmpty

/*:
 ### `length`
 Length of a string.
 */

let length = string.length

/*:
 ### `isBlank`
 Determines if string is blank.
 */

let isNotBlank = string.isBlank
let isBlank = "  ".isBlank

/*:
 ### `urlEscaped`
 Replaces all characters not allowed in url with percent encoded characters
 */

let urlEscaped = "café".urlEscaped

/*:
 ### `isFrenchPhoneNumber`
 Determines if it is a valid french phone number
 */

let isFrenchPhoneNumber = "06 08 15 95 77".isFrenchPhoneNumber

/*:
 ### `isEmail`
 Determines if it is a valid email
 */

let isEmail = "chu@baca.star".isEmail

/*:
 ### `shuffle()`, `shuffled()`
 Shuffles an array.
 > Exists for Array and String.
 */

let shuffled = string.shuffled()


//: < [Summary](Summary) | [Next](@next) >
