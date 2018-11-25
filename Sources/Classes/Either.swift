//
//  Either.swift
//  SwiftXtend
//
//  Created by José Donor on 25/11/2018.
//


/// Wrapper of two different possible values
public struct Either<A, B> {

	public let a: A?
	public let b: B?


	public init(_ a: A) {
		self.a = a
		self.b = nil
	}

	public init(_ b: B) {
		self.a = nil
		self.b = b
	}


	/// Unwraps value and executes matching block
	public func unwrap(_ a: (A) -> Void,
					   or b: (B) -> Void) {

		if let _a = self.a { a(_a) }
		else { b(self.b!) }

	}

	/// Maps value.
	public func map<T>(_ a: (A) -> T,
					   or b: (B) -> T) -> T {

		if let _a = self.a { return a(_a) }
		else { return b(self.b!) }

	}

}


// MARK: Equatable

extension Either: Equatable where A: Equatable, B: Equatable {

	public static func == <A: Equatable, B: Equatable> (lhs: Either<A, B>, rhs: Either<A, B>) -> Bool {

		if let lhsA = lhs.a, let rhsA = rhs.a { return lhsA == rhsA }
		else if let lhsB = lhs.b, let rhsB = rhs.b { return lhsB == rhsB }
		else { return false }

	}

}


// MARK: Similar

extension Either: Similar where A: Similar, B: Similar {

	public static func ~~ <A: Similar, B: Similar> (lhs: Either<A, B>, rhs: Either<A, B>) -> Bool {

		if let lhsA = lhs.a, let rhsA = rhs.a { return lhsA ~~ rhsA }
		else if let lhsB = lhs.b, let rhsB = rhs.b { return lhsB ~~ rhsB }
		else { return false }

	}

}
