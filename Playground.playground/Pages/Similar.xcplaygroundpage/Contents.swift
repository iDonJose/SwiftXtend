/*:
 ## `~~ (similar)`
 Compares similar objects.
 > Operator can compare optional, array, set, dictionary of similar objects.
 > Foundation types have a default implementation of similar.
 */

import SwiftXtend


/// A class conforming to Similar protocol
struct Plane: Similar, Hashable {

    var name: String
    var passengers: Int

    init(name: String,
         passengers: Int) {
        self.name = name
        self.passengers = passengers
    }

    var hashValue: Int {
        return name.hashValue
    }

    static func == (lhs: Plane, rhs: Plane) -> Bool {
        return lhs.name == rhs.name && lhs.passengers == rhs.passengers
    }

    static func ~~ (lhs: Plane, rhs: Plane) -> Bool {
        return lhs.name == rhs.name
    }

}


let A300 = Plane(name: "A300", passengers: 350)
let A300_lowCapacity = Plane(name: "A300", passengers: 50)

var areEqual = A300 == A300_lowCapacity
var areSimilar = A300 ~~ A300_lowCapacity


let Boeing737 = Plane(name: "Boeing737", passengers: 350)

areEqual = A300 == Boeing737
areSimilar = A300 ~~ Boeing737


let Boeing737_lowCapacity = Plane(name: "Boeing737", passengers: 50)

let array_1 = [A300, Boeing737]
let array_2 = [A300_lowCapacity, Boeing737_lowCapacity]

let arrayAreEqual = array_1 == array_2
let arrayAreSimilar = array_1 ~~ array_2


//: < [Summary](Summary) | [Next](@next) >
