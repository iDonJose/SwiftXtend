//
//  Range+Random.swift
//  SwiftXtend
//
//  Created by José Donor on 22/11/2018.
//

import Foundation



// MARK: UInt

extension ClosedRange where Bound == UInt {

	/// Gets a random unsigned int in the range.
	public var random: UInt {
		return lowerBound + UInt(Double(upperBound - lowerBound) * randomClosed())
	}

}

extension Range where Bound == UInt {

	public var random: UInt? {
		guard isNotEmpty else { return nil }
		return (lowerBound...upperBound - 1).random
	}

}

extension PartialRangeFrom where Bound == UInt {

	public var random: UInt {
		return (lowerBound...UInt.max).random
	}

}

extension PartialRangeUpTo where Bound == UInt {

	public var random: UInt {
		return (UInt.min...upperBound - 1).random
	}

}

extension PartialRangeThrough where Bound == UInt {

	public var random: UInt {
		return (UInt.min...upperBound).random
	}

}


// MARK: Int

extension ClosedRange where Bound == Int {

	/// Gets a random int in the range.
	public var random: Int {
		return lowerBound + Int(Double(upperBound - lowerBound) * randomClosed())
	}

}

extension Range where Bound == Int {

	public var random: Int? {
		guard isNotEmpty else { return nil }
		return (lowerBound...upperBound - 1).random
	}

}

extension PartialRangeFrom where Bound == Int {

	public var random: Int {
		return (lowerBound...Int.max).random
	}

}

extension PartialRangeUpTo where Bound == Int {

	public var random: Int {
		return (Int.min...upperBound - 1).random
	}

}

extension PartialRangeThrough where Bound == Int {

	public var random: Int {
		return (Int.min...upperBound).random
	}

}


// MARK: Float

extension ClosedRange where Bound == Float {

	/// Gets a random float in the range.
	public var random: Float {
		return lowerBound + Float(Double(upperBound - lowerBound) * randomClosed())
	}

}

extension Range where Bound == Float {

	public var random: Float? {
		guard isNotEmpty else { return nil }
		let random = (lowerBound...upperBound).random
		return random != upperBound
			? random
			: self.random
	}

}


// MARK: Double

extension ClosedRange where Bound == Double {

	/// Gets a random double in the range.
	public var random: Double {
		return lowerBound + Double(upperBound - lowerBound) * randomClosed()
	}

}

extension Range where Bound == Double {

	public var random: Double? {
		guard isNotEmpty else { return nil }
		let random = (lowerBound...upperBound).random
		return random != upperBound
			? random
			: self.random
	}

}


// MARK: Decimal

extension ClosedRange where Bound == Decimal {

	/// Gets a random decimal in the range.
	public var random: Decimal {

		let percent = Decimal(UInt.random)
		return lowerBound + (upperBound - lowerBound) * percent

	}

}

extension Range where Bound == Decimal {

	public var random: Decimal? {
		guard isNotEmpty else { return nil }
		let random = (lowerBound...upperBound).random
		return random != upperBound
			? random
			: self.random
	}

}



// MARK: - Helpers

/// Source : https://github.com/nvzqz/RandomKit/blob/fc3b55fc9664b73dfcc6495cbd627ba561c8033e/Sources/RandomKit/Types/RandomGenerator/RandomGenerator.swift

private func randomOpen() -> Double {
	return randomHalfOpen() + 0.25 / scale
}

/// Double in [0, 1]
func randomClosed() -> Double {
	return randomHalfOpen() * scale / (scale - 1.5)
}

/// Double in [0, 1)
private func randomHalfOpen() -> Double {
	let upper: UInt64 = 0x3FF0000000000000 // 10 bits
	let lower: UInt64 = 0x000FFFFFFFFFFFFF // 52 bits
	let value = upper | (randomUInt64() & lower)
	return Double(bitPattern: value) - 1.0
}

private func randomUInt64() -> UInt64 {
	var random: UInt64 = 0
	arc4random_buf(&random, MemoryLayout<UInt64>.size)
	return random
}

private let scale = Double(1 << 53 as UInt64)
