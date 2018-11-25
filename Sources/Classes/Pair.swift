//
//  Pair.swift
//  SwiftXtend
//
//  Created by José Donor on 25/11/2018.
//


/// A pair of two objects
public struct Pair<Key: Hashable & Similar, Value: Equatable>: Hashable, Similar {

	public var key: Key
	public var value: Value

	public init(_ key: Key,
				_ value: Value) {
		self.key = key
		self.value = value
	}

	public var hashValue: Int {
		return key.hashValue
	}

	public static func == <Key, Value>(lhs: Pair<Key, Value>, rhs: Pair<Key, Value>) -> Bool {
		return lhs.key == rhs.key
			&& lhs.value == rhs.value
	}

	public static func ~~ <Key, Value>(lhs: Pair<Key, Value>, rhs: Pair<Key, Value>) -> Bool {
		return lhs.key ~~ rhs.key
	}

}
