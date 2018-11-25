/*:
 ## `Either`
 Wrapper of two different possible values
 */

import SwiftXtend

var value = Either<Int, String>("one")

/*:
 ### `unwrap(_:or:)`
 Unwraps value and executes matching block
 */
value.unwrap({ print("Unwrapped Int :", $0) },
             or: { print("Unwrapped String :", $0) })

/*:
 ### `map(_:or:)`
 maps value
 */

let result = value.map({ _ in "It was an Int" },
                       or: { _ in "It was an String" })


//: < [Summary](Summary) | [Next](@next) >
