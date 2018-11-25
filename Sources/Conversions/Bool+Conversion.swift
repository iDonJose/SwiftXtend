//
//  Bool+Conversion.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


extension Bool {

	public var to: Converter {
		return Converter(self)
	}


	public struct Converter {

		private let value: Bool

		fileprivate init (_ value: Bool) {
			self.value = value
		}


		public var uint: UInt {
			return value ? 1 : 0
		}

		public var int: Int {
			return value ? 1 : 0
		}

		public var float: Float {
			return value ? 1 : 0
		}

		public var double: Double {
			return value ? 1 : 0
		}

		public var decimal: Decimal {
			return value ? 1 : 0
		}

		public var string: String {
			return String(value)
		}

	}

}
