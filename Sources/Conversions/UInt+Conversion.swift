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

}


#if USE_UIKIT
import UIKit

extension UInt {

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

        public var nsNumber: NSNumber {
            return NSNumber(value: value)
        }

		public var cgFloat: CGFloat {
			return CGFloat(value)
		}

	}

}

#else

extension UInt {

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

        public var nsNumber: NSNumber {
            return NSNumber(value: value)
        }

	}

}

#endif
