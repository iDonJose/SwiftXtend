//
//  Dictionary+Equatable.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 01/02/2019.
//

import Foundation



public func == <Key: Hashable, Value>(lhs: [Key: Value], rhs: [Key: Value] ) -> Bool {
	return NSDictionary(dictionary: lhs).isEqual(rhs)
}
