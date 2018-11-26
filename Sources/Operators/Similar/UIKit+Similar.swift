//
//  UIKit+Similar.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 26/11/2018.
//


#if USE_UIKIT

extension UIEdgeInsets: Similar {
	public static func ~~ (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> Bool { return lhs == rhs }
}

#endif
