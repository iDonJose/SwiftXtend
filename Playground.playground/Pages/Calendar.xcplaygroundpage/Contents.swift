import SwiftXtend

/*:
 ### `init(identifier:timeZone:)`
 Initializes a calendar with an identifier and a time zone
 */

let calendar = Calendar(identifier: .gregorian,
                        timeZone: TimeZone(secondsFromGMT: 0)!)

/*:
 ### `utc`
 Creates a gregorian calendar with UTC time zone
 */

let utc = Calendar.utc


//: < [Summary](Summary) | [Next](@next) >
