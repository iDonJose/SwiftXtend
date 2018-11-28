//
//  NSWrapper..swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 28/11/2018.
//

// swiftlint:disable force_cast



/// Wraps a Swift type in an NSObject
public final class NSWrapper<Value>: NSObject {

	/// Value
	public var value: Value


	// MARK: - Initialize

	public init(_ value: Value) {
		self.value = value
		super.init()
	}


	// MARK: - Copy

	public override func copy() -> Any {
		return NSWrapper(value)
	}

}


extension NSWrapper where Value: Equatable {

	public static func == (lhs: NSWrapper, rhs: NSWrapper) -> Bool {
		return lhs.value == rhs.value
	}

}

extension NSWrapper where Value: Similar {

	public static func ~~ (lhs: NSWrapper, rhs: NSWrapper) -> Bool {
		return lhs.value ~~ rhs.value
	}

}
