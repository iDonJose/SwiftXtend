//
//  Identifiable.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


/// Provides an identifier
public protocol Identifiable: Hashable, Similar {

	/// Identifier
	var id: String { get set }

}


extension Identifiable {

	public var hashValue: Int {
		return id.hashValue
	}

	/// Determines if there is a valid identifier
	public var isIdentified: Bool {
		return id.isNotEmpty
	}

}
