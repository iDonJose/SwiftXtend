//
//  Array.swift
//  SwiftXtend
//
//  Created by José Donor on 21/11/2018.
//


extension Array {

	/// Indicates that array is not empty
	public var isNotEmpty: Bool {
		return !isEmpty
	}

	/// Index of last element
	public var lastIndex: Int? {
		return isNotEmpty ? endIndex - 1 : nil
	}

	/// Checks if index is valid
	public func isIndexed(with index: Int) -> Bool {
		return isNotEmpty && 0 <= index && index < endIndex
	}


	// MARK: Accessing elements

	/// Safely gets element at index if it exists
	public func get(_ index: Int) -> Element? {

		if isIndexed(with: index) { return self[index] }
		else { return nil }

	}

	/// Safely gets an element if it exists, then applies a block
	public func get(_ index: Int,
					then block: (Element) -> Void) {

		if let element = get(index) { block(element) }

	}

	/// Gets empteenth element of array.
	///
	/// - Parameters:
	///   - empteenth: Position, starting at 1
	///   - matching: Matching filter
	/// - Returns: The element and its index.
	public func empteenth(_ empteenth: Int,
						  matching: (Element) -> Bool) -> Element? {

		guard empteenth != 0 else { return nil }

		guard empteenth > 1 else {
			return first(where: matching)
		}

		let matched = lazy
			.filter(matching)
			.prefix(empteenth)

		return matched.count == empteenth
			? matched.last
			: nil

	}


	// MARK: Removing elements

	/// Removes first element matching
	@discardableResult
	public mutating func removeFirst(where matching: (Element) -> Bool) -> Element? {

		if let index = firstIndex(where: matching) { return remove(at: index) }
		else { return nil }

	}

	/// Removes first element matching
	public func removingFirst(where matching: (Element) -> Bool) -> [Element] {
		var array = self
		array.removeFirst(where: matching)
		return array
	}


	// MARK: Uniquing

	/// Removes all duplicates given an equal condition
	public func uniquing(_ areEqual: (Element, Element) -> Bool) -> [Element] {

		guard isNotEmpty else { return [] }

		var array = prefix(1).map { $0 }

		dropFirst()
			.forEach { element in
				if !array.contains(where: { areEqual($0, element) }) {
					array.append(element)
				}
			}

		return array

	}


	// MARK: Spliting

	/// Splits the array in multiple chunks
	public func split(chunkSize size: Index) -> [[Element]] {

		guard size > 0 else { return [] }

		let endIndex = self.endIndex

		return stride(from: 0, to: endIndex, by: size)
			.map { $0..<($0 + size).max(endIndex) }
			.map { Array(self[$0]) }

	}


	// MARK: Shuffle

	/// Shuffles array.
	public mutating func shuffle() {
		guard count > 1 else { return }

		let max = endIndex - 1

		(0..<max)
			.forEach { i in
				let j = ((i + 1)...max).random
				swapAt(i, j)
			}
	}

	/// Returns an array where elements are shuffled.
	public func shuffled() -> [Element] {
		var array = self
		array.shuffle()
		return array
	}

}


extension Array where Element: Hashable {

	/// Converts array to a set
	public var toSet: Set<Element> {
		return Set(self)
	}

}


extension Array where Element: Equatable {

	// MARK: Removing elements

	/// Removes element
	@discardableResult
	public mutating func removeFirst(_ element: Element) -> Element? {

		if let index = firstIndex(of: element) { return remove(at: index) }
		else { return nil }

	}

	/// Removes element
	public func removingFirst(_ element: Element) -> [Element] {
		var array = self
		array.removeFirst(element)
		return array
	}


	// MARK: Uniquing

	/// Removes all duplicates given an equal condition
	public func uniquing() -> [Element] {
		return self.uniquing(==)
	}

}
