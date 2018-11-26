//
//  Int+Conversion.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


extension Int {

	public var to: Converter {
		return Converter(self)
	}


	public struct Converter {

		private let value: Int

		fileprivate init (_ value: Int) {
			self.value = value
		}


		public var bool: Bool {
			return Bool(value != 0)
		}

		public var uint: UInt {
			return UInt(double)
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
			return IndexPath(row: value, section: 0)
		}

		#if USE_UIKIT
		public var cgFloat: CGFloat {
			return CGFloat(value)
		}
		#endif

	}

}
