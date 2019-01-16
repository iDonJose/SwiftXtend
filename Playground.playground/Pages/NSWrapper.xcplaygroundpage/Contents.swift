/*:
 ## `NSWrapper`
 Wraps any Swift type in an NSObject
 */

import SwiftXtend


let value = [1, 2, 3]

let wrapped = NSWrapper(value)
let wrappedCopy = wrapped.copy() as! NSWrapper<[Int]>

let newValue = wrappedCopy.value


//: < [Summary](Summary) | [Next](@next) >
