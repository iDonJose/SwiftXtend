//
//  NSNumber.swift
//  SwiftXtend
//
//  Created by José Donor on 10/12/2018.
//


extension NSNumber {

	/// Absolute value
	public var abs: NSNumber {
		return Swift.abs(to.double).to.nsNumber
	}

	/// Restricts to a maximum value.
	public func max(_ maximum: NSNumber) -> NSNumber {
		return Swift.min(to.double, maximum.to.double).to.nsNumber
	}

	/// Restricts to a minimum value.
	public func min(_ minimum: NSNumber) -> NSNumber {
		return Swift.max(to.double, minimum.to.double).to.nsNumber
	}

	/// Restricts value to a given range.
	public func `in`(_ minimum: NSNumber,
					 _ maximum: NSNumber) -> NSNumber {
		return min(minimum).max(maximum)
	}

	/// Rounds down to nearest integer.
	public var floor: NSNumber {
		return Foundation.floor(to.double).to.nsNumber
	}

	/// Rounds up to nearest integer.
	public var ceil: NSNumber {
		return Foundation.ceil(to.double).to.nsNumber
	}

}
