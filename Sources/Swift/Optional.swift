//
//  Optional.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 19/12/2018.
//


extension Optional {

	/// Replacement for 'if let .. { .. } else { .. }'
	public func unwrap(then block: (Wrapped) -> Void,
					   else elseBlock: (() -> Void)? = nil) {
		if let value = self {
			block(value)
		}
		else {
			elseBlock?()
		}
	}

}
