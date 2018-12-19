//
//  Optional.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 19/12/2018.
//


extension Optional {

	/// Safely applies a block the wrapped value if it is not nil
	public func unwrap(then block: (Wrapped) -> Void) {
		if let value = self {
			block(value)
		}
	}

}
