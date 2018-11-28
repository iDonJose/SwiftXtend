//
//  UIKit+Similar.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 26/11/2018.
//

#if USE_UIKIT
import UIKit



extension UIEdgeInsets: Similar {
	public static func ~~ (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> Bool { return lhs == rhs }
}

extension UIColor: Similar {
	public static func ~~ (lhs: UIColor, rhs: UIColor) -> Bool { return lhs == rhs }
}

extension UIFont: Similar {
	public static func ~~ (lhs: UIFont, rhs: UIFont) -> Bool { return lhs == rhs }
}

#endif
