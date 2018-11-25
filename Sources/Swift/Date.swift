//
//  Date.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


extension Date {

	// MARK: - Initialize

	/// Initializes a Date with a number of seconds since 1970
	public init(seconds: TimeInterval) {
		self.init(timeIntervalSince1970: seconds)
	}

	/// Initializes a Date with a the a number of milliseconds since 1970
	public init(milliseconds: Double) {
		self.init(seconds: milliseconds / 1_000)
	}

	/// Initializes a Date with date components
	public init(years: Int,
				months: Int,
				days: Int,
				hours: Int? = nil,
				minutes: Int? = nil,
				seconds: Int? = nil,
				calendar: Calendar) {

		let date = Date().changing(years: years,
								   months: months,
								   days: days,
								   hours: hours,
								   minutes: minutes,
								   seconds: seconds,
								   calendar: calendar)

		self.init(seconds: date.secondsSince1970)

	}

	/// Initializes a Date from a String
	///
	/// - Parameters:
	///   - string: String representation
	///   - format: Date format
	///   - timeZone: Time zone of the generated date
	public init?(string: String,
				 format: String,
				 timeZone: TimeZone) {

		let formatter = DateFormatter()
		formatter.dateFormat = format
		formatter.timeZone = timeZone

		guard let date = formatter.date(from: string) else { return nil }

		self.init(seconds: date.secondsSince1970)

	}

	///  Initializes a Date from a String
	///
	/// - Parameters:
	///   - dateStyle: Date style
	///   - timeStyle: Time style
	///   - locale: Locale
	///   - timeZone: Time zone of the generated date
	public init?(string: String,
				 dateStyle: DateFormatter.Style,
				 timeStyle: DateFormatter.Style,
				 locale: Locale,
				 timeZone: TimeZone) {

		let formatter = DateFormatter()
		formatter.dateStyle = dateStyle
		formatter.timeStyle = timeStyle
		formatter.timeZone = timeZone
		formatter.locale = locale

		guard let date = formatter.date(from: string) else { return nil }

		self.init(seconds: date.secondsSince1970)

	}

	/// Current date
	public static var now: Date {
		return Date()
	}



	// MARK: - Date components

	/// Gets date components
	public func components(_ components: Set<Calendar.Component>,
						   calendar: Calendar) -> DateComponents {
		return calendar.dateComponents(components, from: self)
	}

	/// Gets the number of seconds
	public func years(_ calendar: Calendar) -> Int {
		return calendar.dateComponents([.year], from: self).year!
	}

	/// Gets the number of seconds
	public func months(_ calendar: Calendar) -> Int {
		return calendar.dateComponents([.month], from: self).month!
	}

	/// Gets the weekday position in the month.
	/// For example if the date is the first Tuesday of the month, it will return 1.
	public func weekdayOrdinal(_ calendar: Calendar) -> Int {
		return calendar.dateComponents([.weekdayOrdinal], from: self).weekdayOrdinal!
	}

	/// Gets the week position in the month. Starts at 1.
	public func weekOfMonth(_ calendar: Calendar) -> Int {
		return calendar.dateComponents([.weekOfMonth], from: self).weekOfMonth!
	}

	/// Gets the week position in the year. Starts at 1.
	public func weekOfYear(_ calendar: Calendar) -> Int {
		return calendar.dateComponents([.weekOfYear], from: self).weekOfYear!
	}

	/// Gets the day of the week.
	/// In the Gregorian calendar : [1: Sunday, 2: Monday, 3: Tuesday, ...]
	public func weekday(_ calendar: Calendar) -> Int {
		return calendar.dateComponents([.weekday], from: self).weekday!
	}

	/// Gets the number of days
	public func days(_ calendar: Calendar) -> Int {
		return calendar.dateComponents([.day], from: self).day!
	}

	/// Gets the number of hours
	public func hours(_ calendar: Calendar) -> Int {
		return calendar.dateComponents([.hour], from: self).hour!
	}

	/// Gets the number of seconds
	public func minutes(_ calendar: Calendar) -> Int {
		return calendar.dateComponents([.minute], from: self).minute!
	}

	/// Gets the number of seconds
	public func seconds(_ calendar: Calendar) -> Int {
		return calendar.dateComponents([.second], from: self).second!
	}



	// MARK: - Date properties

	/// Seconds since 1970
	public var secondsSince1970: Double {
		return timeIntervalSince1970
	}

	/// Milliseconds since 1970
	public var millisecondsSince1970: Double {
		return timeIntervalSince1970 * 1_000
	}


	/// Date's year start
	public func year(_ calendar: Calendar) -> Date {
		return changing(months: 1, days: 1, hours: 0, minutes: 0, seconds: 0, calendar: calendar)
	}



	/// Date's month start
	public func month(_ calendar: Calendar) -> Date {
		return changing(days: 1, hours: 0, minutes: 0, seconds: 0, calendar: calendar)
	}

	/// Date's week start
	public func week(_ calendar: Calendar) -> Date {
		return day(calendar)
			.removing(days: weekday(calendar) - calendar.firstWeekday, calendar: calendar)
	}

	/// Date's day start
	public func day(_ calendar: Calendar) -> Date {
		return changing(hours: 0, minutes: 0, seconds: 0, calendar: calendar)
	}

	/// Date's hour start
	public func hour(_ calendar: Calendar) -> Date {
		return changing(minutes: 0, seconds: 0, calendar: calendar)
	}

	/// Date's minute start
	public func minute(_ calendar: Calendar) -> Date {
		return changing(seconds: 0, calendar: calendar)
	}



	// MARK: - Changing date

	/// Changes date's components
	public func changing(years: Int? = nil,
						 months: Int? = nil,
						 days: Int? = nil,
						 hours: Int? = nil,
						 minutes: Int? = nil,
						 seconds: Int? = nil,
						 calendar: Calendar) -> Date {

		var components = self.components([.year, .month, .day, .hour, .minute, .second],
										 calendar: calendar)

		if let seconds = seconds { components.second = seconds }
		if let minutes = minutes { components.minute = minutes }
		if let hours = hours { components.hour = hours }
		if let days = days { components.day = days }
		if let months = months { components.month = months }
		if let years = years { components.year = years }

		return calendar.date(from: components) ?? self

	}

	/// Changes date's weekday component
	public func changing(weekday: Int,
						 calendar: Calendar) -> Date {

		var components = self.components([.weekday], calendar: calendar)
		components.weekday = weekday
		return calendar.date(from: components) ?? self
	}

	/// Changes date's weekday ordinal component
	public func changing(weekdayOrdinal: Int,
						 calendar: Calendar) -> Date {

		var components = self.components([.weekdayOrdinal], calendar: calendar)
		components.weekdayOrdinal = weekdayOrdinal
		return calendar.date(from: components) ?? self
	}

	/// Changes date's week position in month component
	public func changing(weekOfMonth: Int,
						 calendar: Calendar) -> Date {

		var components = self.components([.weekOfMonth], calendar: calendar)
		components.weekOfMonth = weekOfMonth
		return calendar.date(from: components) ?? self
	}

	/// Changes date's week position in year component
	public func changing(weekOfYear: Int,
						 calendar: Calendar) -> Date {

		var components = self.components([.weekOfYear], calendar: calendar)
		components.weekOfYear = weekOfYear
		return calendar.date(from: components) ?? self
	}


	/// Addition on date's components
	public func adding(years: Int? = nil,
					   months: Int? = nil,
					   days: Int? = nil,
					   hours: Int? = nil,
					   minutes: Int? = nil,
					   seconds: Int? = nil,
					   calendar: Calendar) -> Date {

		var date = self

		if let seconds = seconds {
			date = calendar.date(byAdding: .second, value: seconds, to: date) ?? date
		}
		if let minutes = minutes {
			date = calendar.date(byAdding: .minute, value: minutes, to: date) ?? date
		}
		if let hours = hours {
			date = calendar.date(byAdding: .hour, value: hours, to: date) ?? date
		}
		if let days = days {
			date = calendar.date(byAdding: .day, value: days, to: date) ?? date
		}
		if let months = months {
			date = calendar.date(byAdding: .month, value: months, to: date) ?? date
		}
		if let years = years {
			date = calendar.date(byAdding: .year, value: years, to: date) ?? date
		}

		return date

	}


	/// Subtraction on date's components
	public func removing(years: Int? = nil,
						 months: Int? = nil,
						 days: Int? = nil,
						 hours: Int? = nil,
						 minutes: Int? = nil,
						 seconds: Int? = nil,
						 calendar: Calendar) -> Date {

		return adding(years: years != nil ? -years! : nil,
					  months: months != nil ? -months! : nil,
					  days: days != nil ? -days! : nil,
					  hours: hours != nil ? -hours! : nil,
					  minutes: minutes != nil ? -minutes! : nil,
					  seconds: seconds != nil ? -seconds! : nil,
					  calendar: calendar)
	}



	// MARK: - Relative time

	public func relativeTime(from date: Date,
							 calendar: Calendar) -> String {

		if self <= date {

			let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self, to: date)

			let years = components.year!

			if years == 1 { return "last year" }
			else if years > 1 { return "\(years) years ago" }

			let months = components.month!

			if months == 1 { return "last month" }
			else if months > 1 { return "\(months) months ago" }

			let days = components.day!

			if days == 1 { return "yesterday" }
			else if days < 8 { return "\(days) days ago" }
			else if days < 14 { return "last week" }
			else if days >= 14 { return "\(days / 7) weeks ago" }

			let hours = components.hour!

			if hours == 1 { return "last hour" }
			else if hours > 1 { return "\(hours) hours ago" }

			let minutes = components.minute!

			if minutes == 1 { return "last minute" }
			else if minutes > 1 { return "\(minutes) minutes ago" }

			let seconds = components.second!

			if seconds < 5 { return "now" }
			else if seconds >= 5 { return "\(seconds) seconds ago" }

		}
		else {

			let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date, to: self)

			let years = components.year!

			if years == 1 { return "next year" }
			else if years > 1 { return "in \(years) years" }

			let months = components.month!

			if months == 1 { return "next month" }
			else if months > 1 { return "in \(months) months" }

			let days = components.day!

			if days == 1 { return "tomorrow" }
			else if days < 8 { return "in \(days) days" }
			else if days < 14 { return "next week" }
			else if days >= 14 { return "in \(days / 7) weeks" }

			let hours = components.hour!

			if hours == 1 { return "in one hour" }
			else if hours > 1 { return "in \(hours) hours" }

			let minutes = components.minute!

			if minutes == 1 { return "in a minute" }
			else if minutes > 1 { return "in \(minutes) minutes" }

			let seconds = components.second!

			if seconds < 5 { return "now" }
			else if seconds >= 5 { return "in \(seconds) seconds" }

		}

		return "now"

	}



	// MARK: - Formatting

	/// Converts date to text with a given format
	public func formatted(with format: String,
						  timeZone: TimeZone) -> String {

		let formatter = DateFormatter()
		formatter.dateFormat = format
		formatter.timeZone = timeZone

		return formatter.string(from: self)

	}

	/// Converts date to text
	public func formatted(dateStyle: DateFormatter.Style,
						  timeStyle: DateFormatter.Style,
						  locale: Locale,
						  timeZone: TimeZone) -> String {

		let formatter = DateFormatter()
		formatter.dateStyle = dateStyle
		formatter.timeStyle = timeStyle
		formatter.locale = locale
		formatter.timeZone = timeZone

		return formatter.string(from: self)

	}

}
