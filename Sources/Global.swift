//
//  Global.swift
//  SwiftXtend-Tests
//
//  Created by José Donor on 24/11/2018.
//


/// Hexadecimal address of the object.
///
/// - Parameter object: Object.
/// - Returns: The  hexadecimal address.
public func hexAddress(_ object: AnyObject) -> String {
	return Unmanaged<AnyObject>.passUnretained(object).toOpaque().debugDescription
}
