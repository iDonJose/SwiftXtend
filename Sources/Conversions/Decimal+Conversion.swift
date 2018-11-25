//
//  Decimal+Conversion.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


extension Decimal {

	public var to: Converter {
		return Converter(self)
	}


	public struct Converter {

		private let value: Decimal

		fileprivate init (_ value: Decimal) {
			self.value = value
		}


		public var bool: Bool {
			return Bool(value != 0)
		}

		public var uint: UInt {
			return nsDecimalNumber.uintValue
		}

		public var int: Int {
			return nsDecimalNumber.intValue
		}

		public var float: Float {
			return nsDecimalNumber.floatValue
		}

		public var double: Double {
			return nsDecimalNumber.doubleValue
		}

		public var nsDecimalNumber: NSDecimalNumber {
			return NSDecimalNumber(decimal: value)
		}

		public var string: String {
			return value.description
		}

	}

}
