//
//  Swap.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 27/02/2019.
//

import Foundation



infix operator <>: AssignmentPrecedence



/// Assign a new value only if old one is different from new one
///
/// - Parameters:
///   - lhs: Value to be modified
///   - rhs: New value
/// - Returns: Old value
@discardableResult
public func <> <T: Equatable>(lhs: inout T, rhs: T) -> T {
	let old = lhs
	if lhs != rhs { lhs = rhs }
	return old
}
