//
//  Float.swift
//  SwiftXtend
//
//  Created by José Donor on 22/11/2018.
//


extension Float {

	/// Absolute value
	public var abs: Float {
		return Swift.abs(self)
	}

	/// Restricts to a maximum value.
	public func max(_ maximum: Float) -> Float {
		return Swift.min(self, maximum)
	}

	/// Restricts to a minimum value.
	public func min(_ minimum: Float) -> Float {
		return Swift.max(self, minimum)
	}

	/// Restricts value to a given range.
	public func `in`(_ a: Float,
					 _ b: Float) -> Float {
		return a < b
            ? min(a).max(b)
            : min(b).max(a)
	}

	/// Rounds down to nearest integer.
	public var floor: Float {
		return Foundation.floor(self)
	}

	/// Rounds up to nearest integer.
	public var ceil: Float {
		return Foundation.ceil(self)
	}

}
