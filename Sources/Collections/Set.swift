//
//  Set.swift
//  SwiftXtend
//
//  Created by José Donor on 21/11/2018.
//


extension Set {

	/// Indicates that set is not empty
	public var isNotEmpty: Bool {
		return !isEmpty
	}

	/// Converts set to a array
	public var toArray: [Element] {
		return Array(self)
	}

}
