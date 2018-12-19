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

}


#if USE_UIKIT
import UIKit

extension Int {

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

		public func indexPath(section: Int = 0) -> IndexPath {
			return IndexPath(row: value, section: section)
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

extension Int {

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

		public func indexPath(section: Int = 0) -> IndexPath {
			return IndexPath(row: value, section: section)
		}

        public var nsNumber: NSNumber {
            return NSNumber(value: value)
        }

	}

}

#endif
