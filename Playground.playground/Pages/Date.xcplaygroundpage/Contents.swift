import SwiftXtend

/*:
 ### `init(seconds:), init(milliseconds:)`
 Initializes a Date from seconds or milliseconds from 1970
 */

let dateFromSeconds = Date(seconds: 1_000_000)
let dateFromMilliseconds = Date(milliseconds: 1_000_000_000)

/*:
 ### `init(years:months:days:hours:minutes:seconds:calendar:)`
 Initializes a Date with components
 */

let dateFromComponents = Date(years: 2020, months: 2, days: 10, calendar: .current)

/*:
 ### `init(string:format:timeZone:), init(string:dateStyle:timeStyle:locale:timeZone:)`
 Initializes a Date from a string
 */

let dateFromStringAndFormat = Date(string: "2020-02-11", format: "yyyy-MM-dd", timeZone: .current)!

let dateFromStringAndStyle = Date(string: "12/02/20", dateStyle: .short, timeStyle: .none, locale: .current, timeZone: .current)!

/*:
 ### `.now`
 Gets current date
 */

let now = Date.now

/*:
 ### `components(_:calendar:)`
 Gets date's components
 */

let components = Date.now.components([.year], calendar: .current)

/*:
 ### `years(_:), months(_:), weekdayOrdinal(_:), weekOfMonth(_:), weekOfYear(_:), weekday(_:), days(_:), hours(_:), minutes(_:), seconds(_:)`
 Gets a specific date's component
 */

let minutes = Date.now.minutes(.current)

/*:
 ### `secondsSince1970, millisecondsSince1970`
 Gets date's seconds/milliseconds from 1970
 */

let secondsSince1970 = Date.now.secondsSince1970

/*:
 ### `year(_:), month(_:), week(_:), day(_:), hour(_:), minute(_:), second(_:), `
 Gets a specfic moment relative to the date, it can be the month start, the day start...
 */

let dayStart = Date.now.day(.current)

/*:
 ### `changing(years:months:days:hours:minutes:seconds:calendar:), changing(weekday:calendar:), changing(weekdayOrdinal:calendar:), changing(weekOfMonth:calendar:), changing(weekOfYear:calendar:)`
 Changes date's components
 */

let dateWithYear2030 = Date.now.changing(years: 2030, calendar: .current)

/*:
 ### `adding(years:months:days:hours:minutes:seconds:calendar:), removing(years:months:days:hours:minutes:seconds:calendar:)`
 Adds or removes to date's components
 */

let dateIn30Minutes = Date.now.adding(minutes: 30, calendar: .current)

/*:
 ### `relativeTime(from:calendar:)`
 Gets relative time between two dates
 */

let relativeTimeFromYearStart = Date.now.year(.current).relativeTime(from: .now, calendar: .current)

/*:
 ### `formatted(with:timeZone:), formatted(dateStyle:timeStyle:locale:timeZone:)`
 Converts date to text
 */

let today = Date.now.day(.current).formatted(with: "dd - MM - yyyy", timeZone: .current)


//: < [Summary](Summary) | [Next](@next) >
