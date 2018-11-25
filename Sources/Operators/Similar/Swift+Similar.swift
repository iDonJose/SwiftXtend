//
//  Swift+Similar.swift
//  SwiftXtend
//
//  Created by José Donor on 21/11/2018.
//

import Foundation



extension Bool: Similar {
	public static func ~~ (lhs: Bool, rhs: Bool) -> Bool { return lhs == rhs }
}


extension UInt: Similar {
	public static func ~~ (lhs: UInt, rhs: UInt) -> Bool { return lhs == rhs }
}

extension Int: Similar {
	public static func ~~ (lhs: Int, rhs: Int) -> Bool { return lhs == rhs }
}

extension Float: Similar {
	public static func ~~ (lhs: Float, rhs: Float) -> Bool { return lhs == rhs }
}

extension Double: Similar {
	public static func ~~ (lhs: Double, rhs: Double) -> Bool { return lhs == rhs }
}

extension Decimal: Similar {
	public static func ~~ (lhs: Decimal, rhs: Decimal) -> Bool { return lhs == rhs }
}


extension Date: Similar {
	public static func ~~ (lhs: Date, rhs: Date) -> Bool { return lhs == rhs }
}


extension String: Similar {
	public static func ~~ (lhs: String, rhs: String) -> Bool { return lhs == rhs }
}


extension NSAttributedString: Similar {
	public static func ~~ (lhs: NSAttributedString, rhs: NSAttributedString) -> Bool { return lhs.isEqual(to: rhs) }
}

extension NSAttributedString.Key: Similar {
	public static func ~~ (lhs: NSAttributedString.Key, rhs: NSAttributedString.Key) -> Bool { return lhs == rhs }
}
