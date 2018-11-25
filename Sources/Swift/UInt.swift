//
//  UInt.swift
//  SwiftXtend
//
//  Created by José Donor on 22/11/2018.
//


extension UInt {

	/// Restricts to a maximum value.
	public func max(_ maximum: UInt) -> UInt {
		return Swift.min(self, maximum)
	}

	/// Restricts to a minimum value.
	public func min(_ minimum: UInt) -> UInt {
		return Swift.max(self, minimum)
	}

	/// Restricts value to a given range.
	public func `in`(_ minimum: UInt,
					 _ maximum: UInt) -> UInt {
		return min(minimum).max(maximum)
	}

}
