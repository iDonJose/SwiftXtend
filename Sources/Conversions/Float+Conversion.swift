//
//  Float+Conversion.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


extension Float {

	public var to: Converter {
		return Converter(self)
	}


	public struct Converter {

		private let value: Float

		fileprivate init (_ value: Float) {
			self.value = value
		}


		public var bool: Bool {
			return Bool(value != 0)
		}

		public var uint: UInt {
			return UInt(value)
		}

		public var int: Int {
			return Int(value)
		}

		public var double: Double {
			return Double(value)
		}

		public var decimal: Decimal {
			return Decimal(double)
		}

		public var string: String {
			return String(value)
		}

	}

}
