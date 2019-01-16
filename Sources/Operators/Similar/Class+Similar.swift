//
//  Class+Similar.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 16/01/2019.
//


extension Vector2D: Similar {
	public static func ~~ (lhs: Vector2D, rhs: Vector2D) -> Bool { return lhs == rhs }
}
