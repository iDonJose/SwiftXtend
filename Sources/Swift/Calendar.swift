//
//  Calendar.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//

extension Calendar {

	/// Initializes Calendar with identifier and time zone
	public init(identifier: Calendar.Identifier = .gregorian,
				timeZone: TimeZone) {

		self.init(identifier: identifier)
		self.timeZone = timeZone

	}

	/// Gregorian calendar with utc time zone
	public static var utc: Calendar {
		return .init(identifier: .gregorian, timeZone: .utc)
	}

}
