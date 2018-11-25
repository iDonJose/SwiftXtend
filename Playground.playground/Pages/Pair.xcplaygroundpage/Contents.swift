/*:
 ## `Pair<Key, Value>`
 A pair of two objects
 */

import SwiftXtend


let pair_1 = Pair<Int, String>(3, "three")
let pair_2 = Pair<Int, String>(3, "trois")

let areEqual = pair_1 == pair_2
let areSimilar = pair_1 ~~ pair_2

/// Pairs can be used in a Set without extra setup as it conforms to Hashable
let set = Set([pair_1, pair_2])


//: < [Summary](Summary) | [Next](@next) >
