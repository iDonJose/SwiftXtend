//
//  Swift+Identifiable.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 19/12/2018.
//


extension Bool: Identifiable {
	public typealias Identifier = Bool
	public var id: Identifier { return self }
}

extension UInt: Identifiable {
	public typealias Identifier = UInt
	public var id: Identifier { return self }
}
extension Int: Identifiable {
	public typealias Identifier = Int
	public var id: Identifier { return self }
}

extension Float: Identifiable {
	public typealias Identifier = Float
	public var id: Identifier { return self }
}
extension Double: Identifiable {
	public typealias Identifier = Double
	public var id: Identifier { return self }
}
extension Decimal: Identifiable {
	public typealias Identifier = Decimal
	public var id: Identifier { return self }
}

extension String: Identifiable {
	public typealias Identifier = String
	public var id: Identifier { return self }
}

extension Date: Identifiable {
	public typealias Identifier = Date
	public var id: Identifier { return self }
}

extension IndexPath: Identifiable {
	public typealias Identifier = IndexPath
	public var id: Identifier { return self }
}
