//
//  Vector2D.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 06/12/2018.
//


public struct Vector2D: Initializable, Hashable, Codable {

	/// X value
	public var x: Double
	/// Y value
	public var y: Double



	// MARK: - Initialize

	public init() {
		self.init(x: 0, y: 0)
	}

	public init(x: Double,
				y: Double) {
		self.x = x
		self.y = y
	}


	/// Vector (0, 0)
	public static var zero: Vector2D {
		return .init(x: 0, y: 0)
	}

	/// Vector (1, 1)
	public static var one: Vector2D {
		return .init(x: 1, y: 1)
	}


    /// Norm
    public var norm: Double {
        return sqrt(pow(x, 2) + pow(y, 2))
    }

    /// Normed point
    public func normed() -> Vector2D {
        let norm = self.norm
        return Vector2D(x: x / norm,
                        y: y / norm)
    }


    /// Calculates angle from vector to another.
    /// Result angle is in [0, 2pi] radians
    public func angle(to vector: Vector2D) -> Double {

        var angle = atan2(y, x) - atan2(vector.y, vector.x)
        if angle < 0 { angle += 2 * .pi }

        return angle
    }

    /// Rotates vector by a given angle (radians)
    public func rotating(by angle: Double) -> Vector2D {

        let cos = Foundation.cos(angle)
        let sin = Foundation.sin(angle)

        return Vector2D(x: x * cos - y * sin,
                        y: x * sin + y * cos)
    }

}


#if USE_UIKIT
import UIKit

extension Vector2D {

	/// CGVector
	public var cgVector: CGVector {
		return CGVector(dx: x, dy: y)
	}

}

extension CGVector {

	/// Vector2D
	public var vector2D: Vector2D {
		return Vector2D(x: Double(dx), y: Double(dy))
	}

}

#endif



// MARK: Similar

extension Vector2D: Similar {

	public static func ~~ (lhs: Vector2D, rhs: Vector2D) -> Bool {
		return lhs == rhs
	}
}


// MARK: Interpolable

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


// MARK: - Operators

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
