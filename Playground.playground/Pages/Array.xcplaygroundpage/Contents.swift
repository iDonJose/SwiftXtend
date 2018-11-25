import SwiftXtend

let array = [1, 2, 3, 4, 5]
print("Array :", array)

/*:
 ### `isNotEmpty`
 Checks if a collection is not empty.
 */

let isNotEmpty = array.isNotEmpty

/*:
 ### `lastIndex`
 Gets last index.
 */

let lastIndex = array.lastIndex

/*:
 ### `isIndexed(with:)`
 Checks index.
 */

let isIndexedWith2 = array.isIndexed(with: 2)
let isIndexedWith20 = array.isIndexed(with: 20)

/*:
 ### `get(_:)`
 Safely gets an element
 */

let elementAtIndex2 = array.get(2)
let elementAtIndex20 = array.get(20)

/*:
 ### `get(_:do:)`
 Safely applies a block on an element
 */

array.get(2) { print("Element at index 2 :", $0) }
array.get(20) { _ in print("should not be executed") }

/*:
 ### `empteenth(_:matching:)`
 Gets empteenth element of array
 */

let thirdOddValue = array.empteenth(3, matching: { $0 % 2 == 1 })
let thirdEvenValue = array.empteenth(3, matching: { $0 % 2 == 0 })

/*:
 ### `removeFirst(where:)`, `removingFirst(where:)`
 Removes first element matching condition.
 > See `removeFirst(_:)`, `removingFirst(_:)` for array of Equatables
 */

let arrayWithoutFirstEvenValue = array.removingFirst { $0 % 2 == 0 }

/*:
 ### `uniquing(_:)`
 Removes all duplicates
 > See `uniquing()` for array of Equatables
 */

let arrayOfDuplicates = array + array + array
let arrayWithoutDuplicates = arrayOfDuplicates.uniquing(==)

/*:
 ### `split(chunkSize:)`
 Splits the array in multiple chunks
 */

let splitted = array.split(chunkSize: 2)

/*:
 ### `shuffle()`, `shuffled()`
 Shuffles array.
 */

let shuffled = array.shuffled()


//: < [Summary](Summary) | [Next](@next) >
