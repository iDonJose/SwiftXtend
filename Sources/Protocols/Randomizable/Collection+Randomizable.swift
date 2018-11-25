//
//  Collection+Randomizable.swift
//  SwiftXtend
//
//  Created by José Donor on 22/11/2018.
//

import Foundation



// MARK: Array

extension Array: CRandomizable {

	/// Gets a random element.
	public var random: Element? {
		guard !isEmpty else { return nil }
		return self[index(startIndex, offsetBy: (0..<count).random!)]
	}

	/// Gets an array of random elements.
	public func randomSubset(ofSize size: Int) -> [Element] {
		guard 0 < size && size <= count else { return [] }

		var indices = (0..<count).map { $0 }

		return (0..<size)
			.map { _ in
				let i = (0..<indices.count).random!
				return indices.remove(at: i)
			}
			.sorted()
			.map { self[$0] }
	}

}


// MARK: Set

extension Set: CRandomizable {

	/// Gets a random element.
	public var random: Element? {
		guard !isEmpty else { return nil }
		return self[index(startIndex, offsetBy: (0..<count).random!)]
	}

	/// Gets a set of random elements.
	public func randomSubset(ofSize size: Int) -> Set<Element> {
		guard 0 < size && size <= count else { return [] }

		var indices = (0..<count).map { $0 }

		return Set((0..<size)
			.map { _ in
				let i = (0..<indices.count).random!
				return indices.remove(at: i)
			}
			.sorted()
			.map { self[index(startIndex, offsetBy: $0)] })
	}

}


// MARK: Dictionary

extension Dictionary: CRandomizable {

	/// Gets a random (key, value) pair.
	public var random: (key: Key, value: Value)? {
		guard !isEmpty else { return nil }
		return self[index(startIndex, offsetBy: (0..<count).random!)]
	}

	/// Gets a set of random dictionary.
	public func randomSubset(ofSize size: Int) -> [Key: Value] {
		guard 0 < size && size <= count else { return [:] }

		var indices = (0..<count).map { $0 }

		let pairs = (0..<size)
			.map { _ in
				let i = (0..<indices.count).random!
				return indices.remove(at: i)
			}
			.sorted()
			.map { self[index(startIndex, offsetBy: $0)] }

		return [Key: Value](uniqueKeysWithValues: pairs)
	}

}


// MARK: LazyCollection

extension LazyCollection {

	/// Gets a random element.
	public var random: Element? {
		guard !isEmpty else { return nil }
		return self[index(startIndex, offsetBy: (0..<count).random!)]
	}

}
