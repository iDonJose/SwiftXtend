//
//  Identifiable.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


/// Provides an identifier
public protocol Identifiable: Hashable, Similar {

	associatedtype Identifier: Hashable

	/// Identifier
	var id: Identifier { get }

}


extension Identifiable {

	public var hashValue: Int {
		return id.hashValue
	}

}


public func ~~ <T: Identifiable>(lhs: T, rhs: T) -> Bool {
	return lhs.id == rhs.id
}
