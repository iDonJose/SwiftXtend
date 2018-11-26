//
//  UIKit+Interpolable.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 26/11/2018.
//


#if USE_UIKIT

// MARK: UIEdgeInsets

extension UIEdgeInsets: Interpolable {

	public typealias Progress = CGFloat

	public static func .. (p: CGFloat, max: UIEdgeInsets) -> (UIEdgeInsets) -> UIEdgeInsets {
		return { min in
			return UIEdgeInsets(top: min.top + (max.top - min.top) * p,
								left: min.left + (max.left - min.left) * p,
								bottom: min.bottom + (max.bottom - min.bottom) * p,
								right: min.right + (max.right - min.right) * p)
		}
	}

	public static func .. (min: UIEdgeInsets, rhs: (UIEdgeInsets) -> UIEdgeInsets) -> UIEdgeInsets {
		return rhs(min)
	}

}

#endif
