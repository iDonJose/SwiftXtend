//
//  Swift+Randomizable.swift
//  SwiftXtend
//
//  Created by José Donor on 22/11/2018.
//

import Foundation



// MARK: Boolean

extension Bool: Randomizable {

	/// A random boolean
	public static var random: Bool {
		return [false, true].random!
	}

}


// MARK: UInt

extension UInt: Randomizable {

	/// A random unsigned int
	public static var random: UInt {
		var random: UInt = 0
		arc4random_buf(&random, MemoryLayout<UInt>.size)
		return random
	}

}


// MARK: Int

extension Int: Randomizable {

	/// A random int
	public static var random: Int {
		var random: Int = 0
		arc4random_buf(&random, MemoryLayout<Int>.size)
		return random
	}

}
