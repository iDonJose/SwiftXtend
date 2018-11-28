//
//  CG+Similar.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 26/11/2018.
//

#if USE_UIKIT
import UIKit



extension CGFloat: Similar {
	public static func ~~ (lhs: CGFloat, rhs: CGFloat) -> Bool { return lhs == rhs }
}

extension CGPoint: Similar {
	public static func ~~ (lhs: CGPoint, rhs: CGPoint) -> Bool { return lhs == rhs }
}

extension CGVector: Similar {
	public static func ~~ (lhs: CGVector, rhs: CGVector) -> Bool { return lhs == rhs }
}

extension CGSize: Similar {
	public static func ~~ (lhs: CGSize, rhs: CGSize) -> Bool { return lhs == rhs }
}

extension CGRect: Similar {
	public static func ~~ (lhs: CGRect, rhs: CGRect) -> Bool { return lhs == rhs }
}


extension CGColor: Similar {
	public static func ~~ (lhs: CGColor, rhs: CGColor) -> Bool { return lhs == rhs }
}

#endif
