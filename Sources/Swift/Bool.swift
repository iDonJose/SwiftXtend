//
//  Bool.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


extension Bool {

	/// Swap with a new boolean value
	///
	/// - Parameter bool: New boolean value
	/// - Returns: Previous value
	@discardableResult
	public mutating func swap(_ newValue: Bool) -> Bool {
		let oldValue = self
		if self != newValue { self = newValue }
		return oldValue
	}

	/// Toggles value
	public func toggled() -> Bool {
		return !self
	}

}


extension Optional where Wrapped == Bool {

	/// Toggles value
	///
	/// - Parameter default: Default value when initial value is null
	/// - Returns: Previous value
	@discardableResult
	public mutating func toggle(default: Bool) -> Bool? {

		let oldValue = self

		if self == nil { self = `default` }
		else { self?.toggle() }

		return oldValue

	}

	/// Toggles value
	public func toggled(default: Bool) -> Bool {
		var value = self
		value.toggle(default: `default`)
		return value!
	}

}
