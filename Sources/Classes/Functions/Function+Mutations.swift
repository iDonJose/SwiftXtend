//
//  Function+Mutations.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 17/12/2018.
//

extension Function {

	/// Sorts control points
	public func sorted() -> Function {
		let controlPoints = self.controlPoints.sorted { $0.x < $1.x }
		return Function(controlPoints: controlPoints)!
	}


	/// Replaces the first tangent of the function.
	///
	/// - Parameters:
	///   - tangent: New tangent
	///   - amplitude: Amplitude in [0, 1], that changes the tangent norm
	/// - Returns: A new Function
	public func replaceFirstTangent(with tangent: Vector2D,
								   	amplitude: Double) -> Function {

		let cp1 = controlPoints[0]
		let cp2 = controlPoints[1]

		let x_max = cp2.point.x + cp2.leftTangent.x - cp1.point.x
		let x = x_max * amplitude

		let tangent = tangent * (x / tangent.x)

		let controlPoint = ControlPoint.tangent(point: cp1.point, tangent: tangent)

		var newControlPoints = controlPoints
		newControlPoints[0] = controlPoint

		return Function(controlPoints: newControlPoints)!
	}

	/// Replaces the last tangent of the function.
	///
	/// - Parameters:
	///   - tangent: New tangent
	///   - amplitude: Amplitude in [0, 1], that changes the tangent norm
	/// - Returns: A new Function
	public func replaceLastTangent(with tangent: Vector2D,
								   amplitude: Double) -> Function {

		let count = controlPoints.count
		let cp3 = controlPoints[count - 2]
		let cp4 = controlPoints[count - 1]

		let x_max = cp4.point.x - (cp3.point.x + cp3.rightTangent.x)
		let x = x_max * amplitude

		let tangent = tangent * (x / tangent.x)

		let controlPoint = ControlPoint.tangent(point: cp4.point, tangent: -tangent)

		var newControlPoints = controlPoints
		newControlPoints[count - 1] = controlPoint

		return Function(controlPoints: newControlPoints)!
	}

}
