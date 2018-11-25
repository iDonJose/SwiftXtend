//
//  UInt+Conversion.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


extension UInt {

	public var to: Converter {
		return Converter(self)
	}


	public struct Converter {

		private let value: UInt

		fileprivate init (_ value: UInt) {
			self.value = value
		}


		public var bool: Bool {
			return Bool(value != 0)
		}

		public var int: Int {
			return Int(double)
		}

		public var float: Float {
			return Float(value)
		}

		public var double: Double {
			return Double(value)
		}

		public var decimal: Decimal {
			return Decimal(value)
		}

		public var string: String {
			return String(value)
		}

		public var indexPath: IndexPath {
			return IndexPath(row: int, section: 0)
		}

	}

}
