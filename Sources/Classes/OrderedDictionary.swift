//
//  OrderedDictionary.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 13/12/2018.
//

// swiftlint:disable empty_count


/// A Dictionary where keys are ordered
public struct OrderedDictionary<Key: Hashable, Value>: ExpressibleByDictionaryLiteral, Sequence, CustomStringConvertible {

	// MARK: - Properties

	/// Dictionary
	public private(set) var dictionary: [Key: Value]
	/// Ordered keys
	public private(set) var keys: [Key]


	/// Count
	public var count: Int {
		return keys.count
	}
	/// Indicates that dictionary is empty
	public var isEmpty: Bool {
		return count == 0
	}
	/// Indicates that dictionary is not empty
	public var isNotEmpty: Bool {
		return !isEmpty
	}
	/// First value
	public var first: Value? {
		return isNotEmpty ? self[keys.first!] : nil
	}
	/// Last value
	public var last: Value? {
		return isNotEmpty ? self[keys.last!] : nil
	}


	// MARK: - Initialize

	public init() {
		dictionary = [:]
		keys = []
	}

	/// Initializes a dictionary with a sequence of key-value pairs.
	/// If two pairs have the same key, only the first pair will be kept.
	public init(dictionaryLiteral elements: (Key, Value)...) {
		self.init(elements)
	}

	/// Initializes a dictionary with a sequence of key-value pairs.
	/// If two pairs have the same key, only the first pair will be kept.
	public init(_ elements: [(Key, Value)]) {

		dictionary = [:]
		keys = []

		elements
			.forEach { key, value in
				if dictionary[key] == nil {
					dictionary[key] = value
					keys.append(key)
				}
			}

	}


	// MARK: - Subscript

	public subscript(key: Key) -> Value? {
		get { return dictionary[key] }
		set {
			let oldValue = dictionary.removeValue(forKey: key)
			dictionary[key] = newValue
			if oldValue == nil && newValue != nil { keys.append(key) }
		}
	}

	public subscript(index: Int) ->(key: Key, value: Value)? {
		get { return get(index) }
		set {
			if let value = newValue { set(value, at: index) }
			else { remove(at: index) }
		}
	}



	// MARK: - Sequence

	public func makeIterator() -> AnyIterator<(Key, Value)> {

		var index = 0

		return AnyIterator {
			guard index < self.keys.count else { return nil }

			let key = self.keys[index]
			let value = self.dictionary[key]!
			index += 1

			return (key, value)
		}

	}


	// MARK: - Methods

	/// Gets key-value pair at a given index
	public func get(_ index: Int) -> (key: Key, value: Value)? {

		guard index < count else { return nil }

		let key = keys[index]
		let value = dictionary[key]!
		return (key, value)
	}

	/// Sets a key-value pair to a given index
	@discardableResult
	public mutating func set(_ pair: (key: Key, value: Value),
							 at index: Int) -> Value? {

		guard index < count else { return nil }

		let key = keys[index]
		let value = pair.value

		let oldValue = dictionary.removeValue(forKey: key)
		if oldValue != nil { keys.removeFirst(key) }
		dictionary[key] = value
		keys.insert(key, at: index)

		return oldValue
	}

	/// Inserts a key-value pair
	public mutating func insert(_ pair: (key: Key, value: Value),
								at index: Int) {

		let key = pair.key
		let value = pair.value

		let oldValue = dictionary.removeValue(forKey: key)
		if oldValue != nil { keys.removeFirst(key) }
		dictionary[key] = value
		keys.insert(key, at: index)

	}

	/// Appends a key-value pair
	public mutating func append(_ pair: (key: Key, value: Value)) {

		let key = pair.key
		let value = pair.value

		let oldValue = dictionary.removeValue(forKey: key)
		if oldValue != nil { keys.removeFirst(key) }
		dictionary[key] = value
		keys.append(key)

	}

	/// Removes key-value pair at a given index
	@discardableResult
	public mutating func remove(at index: Int) -> Value? {

		guard index < count else { return nil }

		let key = keys[index]

		let oldValue = dictionary.removeValue(forKey: key)
		if oldValue != nil { keys.removeFirst(key) }

		return oldValue
	}

	/// Removes all key-values
	public mutating func removeAll() {
		dictionary.removeAll()
		keys.removeAll()
	}

	/// Removes all key-values
	public mutating func removingAll() -> OrderedDictionary<Key, Value> {
		var dictionary = self
		dictionary.removeAll()
		return dictionary
	}

	/// Removes a key and its value. Returns the removed value if any.
	@discardableResult
	public mutating func remove(key: Key) -> Value? {
		guard let index = keys.index(of: key) else { return nil }

		keys.remove(at: index)
		return dictionary.removeValue(forKey: key)
	}

	/// Removes a key and its value.
	public func removing(key: Key) -> OrderedDictionary<Key, Value> {
		var dictionary = self
		dictionary.remove(key: key)
		return dictionary
	}

	/// Sorts keys
	public mutating func sort(by areInIncreasingOrder: ((Key, Value), (Key, Value)) -> Bool) {

		keys = lazy.map { $0 }
			.sorted(by: areInIncreasingOrder)
			.map { $0.0 }
	}

	/// Sorts keys
	public func sorted(by areInIncreasingOrder: ((Key, Value), (Key, Value)) -> Bool) -> OrderedDictionary<Key, Value> {
		var dictionary = self
		dictionary.sort(by: areInIncreasingOrder)
		return dictionary
	}

	public func mapValues<T>(_ transform: (Value) -> T) -> OrderedDictionary<Key, T> {
		return .init(map { ($0, transform($1)) })
	}

	public func compactMapValues<T>(_ transform: (Value) -> T?) -> OrderedDictionary<Key, T> {

		let pairs = compactMap { key, value -> (Key, T)? in
			if let newValue = transform(value) {
				return (key, newValue)
			}
			else { return nil }
		}

		return .init(pairs)
	}



	// MARK: - CustomStringConvertible

	/// Description
	public var description: String {

		let isString = Value.self == String.self

		let pairs: [String]

		if isString { pairs = map { key, value in "\"\(key)\": \(value)" } }
		else { pairs = map { key, value in "\(key): \(value)" } }

		return "[" + pairs.joined(separator: ", ") + "]"
	}


	// MARK: - Operators

	public static func + <Key: Hashable, Value>(lhs: OrderedDictionary<Key, Value>, rhs: OrderedDictionary<Key, Value>) -> OrderedDictionary<Key, Value> {

		var dictionary = lhs

		rhs.forEach { key, value in
			dictionary[key] = value
		}

		return dictionary
	}

}
