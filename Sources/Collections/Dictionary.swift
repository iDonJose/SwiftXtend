//
//  Dictionary.swift
//  SwiftXtend
//
//  Created by José Donor on 21/11/2018.
//


extension Dictionary {

	/// Indicates that dictionary is not empty
	public var isNotEmpty: Bool {
		return !isEmpty
	}

	/// Safely gets a value if it exists, then applies a block
	public func getValue(for key: Key,
						 then block: (Value) -> Void) {

		if let value = self[key] { block(value) }

	}

}
