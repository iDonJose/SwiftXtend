//
//  UIKit+Randomizable.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 27/11/2018.
//

#if USE_UIKIT
import UIKit



// MARK: Range of CGFloat

extension ClosedRange where Bound == CGFloat {

	/// Gets a random float in the range.
	public var random: CGFloat {
		return lowerBound + CGFloat(Double(upperBound - lowerBound) * randomClosed())
	}

}

extension Range where Bound == CGFloat {

	public var random: CGFloat? {
		guard isNotEmpty else { return nil }
		let random = (lowerBound...upperBound).random
		return random != upperBound
			? random
			: self.random
	}

}


// MARK: UIColor

extension UIColor { // Can't conform to Randomizable as UIColor is not final

	public class var random: UIColor {
		let range = (CGFloat(0)...1)
		return UIColor(red: range.random,
					   green: range.random,
					   blue: range.random,
					   alpha: range.random)
	}

}

#endif
