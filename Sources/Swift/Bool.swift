//
//  Bool.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


extension Bool {

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
