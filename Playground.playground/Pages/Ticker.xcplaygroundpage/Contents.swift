/*:
 ## `Ticker`
 A timer
 */

import SwiftXtend

/*:
 ### `every(_:leeway:on:didTick:)`
 A repeating timer
 */

let ticker = Ticker.every(.seconds(3), on: .main) { ticker in
    print("Repeating tick n°\(ticker.count)")
}.start()

/*:
 ### `after(_:on:didTick:)`
 A timer delaying a task
 */

let delay = Ticker.after(.seconds(5), on: .main) { _ in
    print("Delayed tick")
}.start()



//: < [Summary](Summary) | [Next](@next) >
