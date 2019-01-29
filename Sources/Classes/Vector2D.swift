//
//  Vector2D.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 06/12/2018.
//


public struct Vector2D: Initializable, Hashable, Codable, CustomStringConvertible {

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

    /// Normed vector
    public func normed() -> Vector2D {
        let norm = self.norm
        return Vector2D(x: x / norm,
                        y: y / norm)
    }


    /// Calculates angle from one vector to another.
    /// Result angle is in [0, 2pi] radians
    public func angle(to vector: Vector2D) -> Double {

        var angle = atan2(vector.y, vector.x) - atan2(y, x)
        if angle < 0 { angle += 2 * .pi }

        return angle
    }

	/// Calculates angle from one vector to another.
	/// Result angle is in [0, 2pi] radians
	public func angle(from vector: Vector2D) -> Double {
		return 2 * .pi - vector.angle(to: self)
	}

    /// Rotates vector by a given angle (radians)
    public func rotated(by angle: Double) -> Vector2D {

        let cos = Foundation.cos(angle)
        let sin = Foundation.sin(angle)

        return Vector2D(x: x * cos - y * sin,
                        y: x * sin + y * cos)
    }


	/// Description
	public var description: String {
		return "(x: \(x), y: \(y))"
	}

}
