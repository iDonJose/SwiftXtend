//
//  NSNumber+Conversion.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 10/12/2018.
//


extension NSNumber {

	public var to: Converter {
		return Converter(self)
	}

}


#if USE_UIKIT
import UIKit

extension NSNumber {

	public struct Converter {

		private let value: NSNumber

		fileprivate init (_ value: NSNumber) {
			self.value = value
		}


		public var bool: Bool {
			return Bool(value != 0)
		}

		public var uint: UInt {
			return UInt(truncating: value)
		}

		public var int: Int {
			return Int(truncating: value)
		}

		public var float: Float {
			return Float(truncating: value)
		}

		public var double: Double {
			return Double(truncating: value)
		}

		public var decimal: Decimal {
			return Decimal(double)
		}

		public var string: String {
			return String(double)
		}

		public var cgFloat: CGFloat {
			return CGFloat(truncating: value)
		}

	}

}

#else

extension NSNumber {

	public struct Converter {

		private let value: NSNumber

		fileprivate init (_ value: NSNumber) {
			self.value = value
		}


		public var bool: Bool {
			return Bool(value != 0)
		}

		public var uint: UInt {
			return UInt(truncating: value)
		}

		public var int: Int {
			return Int(truncating: value)
		}

		public var float: Float {
			return Float(truncating: value)
		}

		public var double: Double {
			return Double(truncating: value)
		}

		public var decimal: Decimal {
			return Decimal(double)
		}

		public var string: String {
			return String(double)
		}

	}

}

#endif
