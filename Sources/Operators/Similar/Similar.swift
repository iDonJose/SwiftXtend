//
//  Similar.swift
//  SwiftXtend
//
//  Created by José Donor on 21/11/2018.
//


/// Similar protocol helps to find out if two objects are similar/equivalent,
/// meaning that they represent the same object that can be in different states.
public protocol Similar {

	static func ~~ (lhs: Self, rhs: Self) -> Bool

}


infix operator ~~ : ComparisonPrecedence
infix operator !~ : ComparisonPrecedence



public func !~ <T: Similar>(lhs: T, rhs: T) -> Bool {
	return !(lhs ~~ rhs)
}


// MARK: Optionals

public func ~~ <T: Similar>(lhs: T?, rhs: T?) -> Bool {
	switch (rhs, lhs) {
	case (nil, nil): return true
	case (_, nil), (nil, _): return false
	case let (lhs, rhs): return lhs! ~~ rhs!
	}
}

public func !~ <T: Similar>(lhs: T?, rhs: T?) -> Bool {
	return !(lhs ~~ rhs)
}


// MARK: Arrays

public func ~~ <T: Similar>(lhs: [T], rhs: [T]) -> Bool {

	guard lhs.count == rhs.count else { return false }

	return zip(lhs, rhs).lazy
		.first(where: { $0 !~ $1 }) == nil

}

public func !~ <T: Similar>(lhs: [T], rhs: [T]) -> Bool {
	return !(lhs ~~ rhs)
}



// MARK: Sets

public func ~~ <T: Similar>(lhs: Set<T>, rhs: Set<T>) -> Bool {

	guard lhs.count == rhs.count else { return false }

	var rElements = rhs

	for lElement in lhs {
		if let rElement = rElements.first(where: { $0 ~~ lElement }) {
			rElements.remove(rElement)
		}
		else {
			return false
		}
	}

	return true
}

public func !~ <T: Similar>(lhs: Set<T>, rhs: Set<T>) -> Bool {
	return !(lhs ~~ rhs)
}


// MARK: Dictionaries

public func ~~ <Key, Value: Similar>(lhs: [Key: Value], rhs: [Key: Value]) -> Bool {

	guard lhs.count == rhs.count else { return false }

	for (key, _) in lhs {
		switch (lhs[key], rhs[key]) {
		case (nil, nil): break
		case (nil, _), (_, nil): return false
		case let (lhs, rhs): if lhs! !~ rhs! { return false }
		}
	}

	return true
}

public func !~ <Key: Similar, Value: Similar>(lhs: [Key: Value], rhs: [Key: Value]) -> Bool {
	return !(lhs ~~ rhs)
}
