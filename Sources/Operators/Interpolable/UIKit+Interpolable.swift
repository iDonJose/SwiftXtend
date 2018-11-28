//
//  UIKit+Interpolable.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 26/11/2018.
//

#if USE_UIKIT
import UIKit



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


// MARK: UIColor

extension UIColor { /// Can't conform to Interpolable as UIColor is not final

	public typealias Progress = CGFloat

	public final class func .. (p: CGFloat, max: UIColor) -> (UIColor) -> UIColor {
		return { min in

			let minRGBA = min.RGBA
			let maxRGBA = max.RGBA

			return UIColor(red: minRGBA.red + (maxRGBA.red - minRGBA.red) * p,
						   green: minRGBA.green + (maxRGBA.green - minRGBA.green) * p,
						   blue: minRGBA.blue + (maxRGBA.blue - minRGBA.blue) * p,
						   alpha: minRGBA.alpha + (maxRGBA.alpha - minRGBA.alpha) * p)
		}
	}

	public final class func .. (min: UIColor, rhs: (UIColor) -> UIColor) -> UIColor {
		return rhs(min)
	}


	// MARK: - Helper

	/// RGBA components.
	private var RGBA: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {

		var red: CGFloat = 0
		var green: CGFloat = 0
		var blue: CGFloat = 0
		var alpha: CGFloat = 0

		guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else { return (0, 0, 0, 0) }

		return (red, green, blue, alpha)
	}

}

#endif
