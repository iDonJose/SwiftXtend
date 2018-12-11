//
//  Int.swift
//  SwiftXtend
//
//  Created by José Donor on 22/11/2018.
//


extension Int {

	/// Absolute value
	public var abs: Int {
		return Swift.abs(self)
	}

	/// Restricts to a maximum value.
	public func max(_ maximum: Int) -> Int {
		return Swift.min(self, maximum)
	}

	/// Restricts to a minimum value.
	public func min(_ minimum: Int) -> Int {
		return Swift.max(self, minimum)
	}

	/// Restricts value to a given range.
	public func `in`(_ a: Int,
					 _ b: Int) -> Int {
		return a < b
            ? min(a).max(b)
            : min(b).max(a)
	}

}
