//
//  Double.swift
//  SwiftXtend
//
//  Created by José Donor on 22/11/2018.
//


extension Double {

	/// Absolute value
	public var abs: Double {
		return Swift.abs(self)
	}

	/// Restricts to a maximum value.
	public func max(_ maximum: Double) -> Double {
		return Swift.min(self, maximum)
	}

	/// Restricts to a minimum value.
	public func min(_ minimum: Double) -> Double {
		return Swift.max(self, minimum)
	}

	/// Restricts value to a given range.
	public func `in`(_ a: Double,
					 _ b: Double) -> Double {
		return a < b
            ? min(a).max(b)
            : min(b).max(a)
	}

	/// Rounds down to nearest integer.
	public var floor: Double {
		return Foundation.floor(self)
	}

	/// Rounds up to nearest integer.
	public var ceil: Double {
		return Foundation.ceil(self)
	}

}
