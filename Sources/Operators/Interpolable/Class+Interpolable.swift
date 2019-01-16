//
//  Class+Interpolable.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 16/01/2019.
//


extension Vector2D: Interpolable {

	public typealias Progress = Double

	public static func .. (p: Double, max: Vector2D) -> (Vector2D) -> Vector2D {
		return { min in
			return Vector2D(x: min.x + (max.x - min.x) * p,
							y: min.y + (max.y - min.y) * p)
		}
	}

	public static func .. (min: Vector2D, rhs: (Vector2D) -> Vector2D) -> Vector2D {
		return rhs(min)
	}

}
