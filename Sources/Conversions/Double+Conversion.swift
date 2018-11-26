//
//  Double+Conversion.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


extension Double {

	public var to: Converter {
		return Converter(self)
	}


	public struct Converter {

		private let value: Double

		fileprivate init (_ value: Double) {
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

		public var float: Float {
			return Float(value)
		}

		public var decimal: Decimal {
			return Decimal(value)
		}

		public var string: String {
			return String(value)
		}

		#if USE_UIKIT
		public var cgFloat: CGFloat {
			return CGFloat(value)
		}
		#endif
		
	}

}
