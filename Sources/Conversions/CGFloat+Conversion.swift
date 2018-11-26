//
//  CGFloat+Conversion.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 26/11/2018.
//


#if USE_UIKIT
extension CGFloat {

	public var to: Converter {
		return Converter(self)
	}


	public struct Converter {

		private let value: CGFloat

		fileprivate init (_ value: CGFloat) {
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

		public var double: Double {
			return Double(value)
		}

		public var decimal: Decimal {
			return Decimal(double)
		}

		public var string: String {
			return value.description
		}

	}

}
#endif
