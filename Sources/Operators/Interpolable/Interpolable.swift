//
//  Interpolable.swift
//  SwiftXtend
//
//  Created by José Donor on 23/11/2018.
//

/// Similar protocol helps to find out if two objects are similar/equivalent,
/// meaning that they represent the same object that can be in different states.
public protocol Interpolable {

	associatedtype Progress

	static func .. (p: Progress, max: Self) -> (Self) -> Self

	static func .. (min: Self, rhs: (Self) -> Self) -> Self

}


infix operator ..: NilCoalescingPrecedence
