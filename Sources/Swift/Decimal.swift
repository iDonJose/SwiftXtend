//
//  Decimal.swift
//  SwiftXtend
//
//  Created by José Donor on 22/11/2018.
//


extension Decimal {

	/// Absolute value
	public var abs: Decimal {
		return Swift.abs(self)
	}

	/// Restricts to a maximum value.
	public func max(_ maximum: Decimal) -> Decimal {
		return Swift.min(self, maximum)
	}

	/// Restricts to a minimum value.
	public func min(_ minimum: Decimal) -> Decimal {
		return Swift.max(self, minimum)
	}

	/// Restricts value to a given range.
	public func `in`(_ minimum: Decimal,
					 _ maximum: Decimal) -> Decimal {
		return min(minimum).max(maximum)
	}

}
