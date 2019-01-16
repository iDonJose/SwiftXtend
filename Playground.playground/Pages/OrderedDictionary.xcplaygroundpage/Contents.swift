/*:
 ## `OrderedDictionary`
 A Dictionary where keys are ordered 
 */

import SwiftXtend



var orderedDictionary: OrderedDictionary<String, String> = [
    "Mexico": "Mexico City",
    "Australia": "Canberra",
    "Morocco": "Algiers",
    "Nigeria": "Abuja",
    "Costa Rica": "San Jose"
]

// Replaces third value
orderedDictionary[2] = ("Morocco", "Rabat")

let third = orderedDictionary[2]

let sortedByCountry = orderedDictionary
    .sorted(by: { $0.0 < $1.0 })
    .keys

let sortedByCapital = orderedDictionary
    .sorted(by: { $0.1 < $1.1 })
    .keys


//: < [Summary](Summary) | [Next](@next) >
