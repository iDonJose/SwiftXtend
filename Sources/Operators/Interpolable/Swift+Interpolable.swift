//
//  Swift+Interpolable.swift
//  SwiftXtend
//
//  Created by José Donor on 24/11/2018.
//


// MARK: Float

extension Float: Interpolable {

	public typealias Progress = Float

	public static func .. (p: Float, max: Float) -> (Float) -> Float {
		return { min in min + (max - min) * p }
	}

	public static func .. (min: Float, rhs: (Float) -> Float) -> Float {
		return rhs(min)
	}

}


// MARK: Double

extension Double: Interpolable {

	public typealias Progress = Double

	public static func .. (p: Double, max: Double) -> (Double) -> Double {
		return { min in min + (max - min) * p }
	}

	public static func .. (min: Double, rhs: (Double) -> Double) -> Double {
		return rhs(min)
	}

}


// MARK: Decimal

extension Decimal: Interpolable {

	public typealias Progress = Decimal

	public static func .. (p: Decimal, max: Decimal) -> (Decimal) -> Decimal {
		return { min in min + (max - min) * p }
	}

	public static func .. (min: Decimal, rhs: (Decimal) -> Decimal) -> Decimal {
		return rhs(min)
	}

}
