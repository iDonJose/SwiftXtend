//
//  String.swift
//  SwiftXtend
//
//  Created by José Donor on 22/11/2018.
//


extension String {

	/// Converts a number to a specific base
	///
	/// - Parameters:
	///   - number: Number
	///   - radix: Base
	///   - minLength: Minimum length
	public init(number: Int,
				base: Int,
				minLength: Int = 1) {

		let number = number.min(0)
		let base = base.min(2)
		let minLength = minLength.min(1)

		let numberInBase = String(number, radix: base)
		let count = (minLength - numberInBase.count % minLength) % minLength

		self = String(Array(repeating: "0", count: count)) + numberInBase

	}


	/// Indicates that string is not empty
	public var isNotEmpty: Bool {
		return !isEmpty
	}

	/// Length.
	public var length: Int {
		return count
	}

	/// Determines if it is blank
	public var isBlank: Bool {
		return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
	}

	/// Replaces all characters not allowed in url with percent encoded characters
	public var urlEscaped: String {
		return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
	}

	/// Determines if it is a valid french phone number
	public var isFrenchPhoneNumber: Bool {
		do {

			let frenchPattern = "^(?:(?:\\+|00)33|0)\\s*[1-9](?:[\\s.-]*\\d{2}){4}$"
			let regularExpression = try NSRegularExpression(pattern: frenchPattern,
															options: [])

			return regularExpression.firstMatch(in: self,
												options: NSRegularExpression.MatchingOptions.reportProgress,
												range: NSRange(location: 0, length: length)) != nil

		}
		catch { return false }
	}

	/// Determines if it is a valid email address
	public var isEmail: Bool {
		do {

			let pattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
			let regularExpression = try NSRegularExpression(pattern: pattern,
															options: .caseInsensitive)

			return regularExpression.firstMatch(in: self,
												options: NSRegularExpression.MatchingOptions.reportProgress,
												range: NSRange(location: 0, length: length)) != nil

		}
		catch { return false }
	}


	// MARK: Shuffle

	/// Shuffles string.
	public mutating func shuffle() {
		self = String(Array(self).shuffled())
	}

	/// Returns an string where characters are shuffled.
	public func shuffled() -> String {
		var string = self
		string.shuffle()
		return string
	}

}
