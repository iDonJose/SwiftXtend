//
//  CG+Interpolable.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 26/11/2018.
//

#if USE_UIKIT
import UIKit



// MARK: CGFloat

extension CGFloat: Interpolable {

	public typealias Progress = CGFloat

	public static func .. (p: CGFloat, max: CGFloat) -> (CGFloat) -> CGFloat {
		return { min in min + (max - min) * p }
	}

	public static func .. (min: CGFloat, rhs: (CGFloat) -> CGFloat) -> CGFloat {
		return rhs(min)
	}

}


// MARK: CGPoint

extension CGPoint: Interpolable {

	public typealias Progress = CGFloat

	public static func .. (p: CGFloat, max: CGPoint) -> (CGPoint) -> CGPoint {
		return { min in
			return CGPoint(x: min.x + (max.x - min.x) * p,
						   y: min.y + (max.y - min.y) * p)
		}
	}

	public static func .. (min: CGPoint, rhs: (CGPoint) -> CGPoint) -> CGPoint {
		return rhs(min)
	}

}


// MARK: CGVector

extension CGVector: Interpolable {

	public typealias Progress = CGFloat

	public static func .. (p: CGFloat, max: CGVector) -> (CGVector) -> CGVector {
		return { min in
			return CGVector(dx: min.dx + (max.dx - min.dx) * p,
							dy: min.dy + (max.dy - min.dy) * p)
		}
	}

	public static func .. (min: CGVector, rhs: (CGVector) -> CGVector) -> CGVector {
		return rhs(min)
	}

}


// MARK: CGSize

extension CGSize: Interpolable {

	public typealias Progress = CGFloat

	public static func .. (p: CGFloat, max: CGSize) -> (CGSize) -> CGSize {
		return { min in
			return CGSize(width: min.width + (max.width - min.width) * p,
						  height: min.height + (max.height - min.height) * p)
		}
	}

	public static func .. (min: CGSize, rhs: (CGSize) -> CGSize) -> CGSize {
		return rhs(min)
	}

}


// MARK: CGRect

extension CGRect: Interpolable {

	public typealias Progress = CGFloat

	public static func .. (p: CGFloat, max: CGRect) -> (CGRect) -> CGRect {
		return { min in
			return CGRect(x: min.origin.x + (max.origin.x - min.origin.x) * p,
						  y: min.origin.y + (max.origin.y - min.origin.y) * p,
						  width: min.width + (max.width - min.width) * p,
						  height: min.height + (max.height - min.height) * p)
		}
	}

	public static func .. (min: CGRect, rhs: (CGRect) -> CGRect) -> CGRect {
		return rhs(min)
	}

}


// MARK: CGColor

extension CGColor { /// Can't conform to Interpolable as CGColor is not final

	public typealias Progress = CGFloat

	public final class func .. (p: CGFloat, max: CGColor) -> (CGColor) -> CGColor {
		return { min in
			let minColor = UIColor(cgColor: min)
			let maxColor = UIColor(cgColor: max)
			return (minColor..p..maxColor).cgColor
		}
	}

	public final class func .. (min: CGColor, rhs: (CGColor) -> CGColor) -> CGColor {
		return rhs(min)
	}

}

#endif
