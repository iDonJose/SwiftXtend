//
//  Vector2D+Algebra.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 16/01/2019.
//


extension Vector2D {

	// MARK: Addition

	public static func + (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
		return Vector2D(x: lhs.x + rhs.x,
						y: lhs.y + rhs.y)
	}

	public static func - (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
		return lhs + (-rhs)
	}


	// MARK: Product

	public static func * (lhs: Double, rhs: Vector2D) -> Vector2D {
		return Vector2D(x: lhs * rhs.x,
						y: lhs * rhs.y)
	}

	public static func * (lhs: Vector2D, rhs: Double) -> Vector2D {
		return rhs * lhs
	}


	public static prefix func - (vector: Vector2D) -> Vector2D {
		return -1 * vector
	}


	public static func * (lhs: Vector2D, rhs: Vector2D) -> Double {
		return lhs.x * rhs.x + lhs.y * rhs.y
	}

}
