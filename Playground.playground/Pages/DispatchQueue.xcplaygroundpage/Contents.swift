import SwiftXtend

/*:
 ### `syncOnMain(_:)`
 Executes on main queue synchronously
 */

let queue = DispatchQueue(label: "queue", qos: DispatchQoS.utility)

queue.async {
    DispatchQueue.syncOnMain {
        print("Run on main ?", Thread.isMainThread)
    }
}

/*:
 ### `asyncOnMain(_:)`
 Executes on main queue asynchronously
 */

queue.async {
    DispatchQueue.asyncOnMain {
        print("Run on main ?", Thread.isMainThread)
    }
}


//: < [Summary](Summary) | [Next](@next) >
