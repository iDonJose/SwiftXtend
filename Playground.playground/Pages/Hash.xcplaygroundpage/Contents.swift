/*:
 ## `Hash`
 Helper for generating hash values
 */

import SwiftXtend

/*:
 ### `combine(hashes:)`
 Combines hashes
 */

let combinedHash = Hash.combine(hashes: 0.hashValue, 1.hashValue)

/*:
 ### `hash(array:)`
 Hash value for an array
 */

let arrayHash = Hash.hash(array: [1, 2, 3])

/*:
 ### `hash(dictionary:)`
 Hash value for an dictionary
 */

let dictionaryHash = Hash.hash(dictionary: [1: "one", 2: "two", 3: "three"])


//: < [Summary](Summary) | [Next](@next) >
