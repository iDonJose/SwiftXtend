/*:
 ## `Geohash`
 Helper for converting from geolocation to geohash and vice-versa
 */

import SwiftXtend


/*:
 ### `encode(latitude:longitude:precision:)`
 Encodes a location to a geohash
 > See also `encode(latitude:longitude:length:`
 */

let geohash_1 = Geohash.encode(latitude: 45, longitude: 1, precision: 10)

let geohash_2 = Geohash.encode(latitude: 45.0, longitude: 1.0, length: 8)

/*:
 ### `decode(_:)`
 Decodes a geohash
 */

let location = Geohash.decode("spbxyzbp")?.center

/*:
 ### `neighboor(of:)`
 Gets neighbooring geohash
 > See also `neighboor(of:at:)` for neighboor in a given direction
 */

let neighbour = Geohash.neighboor(of: geohash_1)


//: < [Summary](Summary) | [Next](@next) >
