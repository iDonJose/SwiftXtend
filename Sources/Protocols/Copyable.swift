//
//  Copyable.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 20/03/2019.
//


public protocol Copyable {

	/// Initialize by copying another object
	init(copy object: Self)

}


extension Copyable {

	/// Returns a copy of object
	public func copy() -> Self {
		return .init(copy: self)
	}

}
