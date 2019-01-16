//
//  Function+Transformations.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 17/12/2018.
//


extension Function {

	/// Creates a function that is the central symetric
	public func centralSymetric(through center: Vector2D) -> Function {

		func transform(point: Vector2D) -> Vector2D {
			return .init(x: 2 * center.x - point.x,
						 y: 2 * center.y - point.y)
		}


		let newControlPoints = controlPoints
			.reversed()
			.map { controlPoint -> ControlPoint in
				switch controlPoint {

				case let .point(point):
					return .point(transform(point: point))

				case let .tangent(point, tangent):
					return .tangent(point: transform(point: point),
									tangent: tangent)

				case let .semiTangents(point, left, right):
					return .semiTangents(point: transform(point: point),
										 left: -right,
										 right: -left)
				}
			}

		return Function(controlPoints: newControlPoints)!
	}

	/// Creates a function that is the vertical symetric
	public func verticalSymetric(x: Double) -> Function {

		let x_min = controlPoints.first!.point.x
		let x_max = controlPoints.last!.point.x


		func transform(point: Vector2D) -> Vector2D {
			return .init(x: 2 * x - point.x,
						 y: point.y)
		}

		func transform(tangent: Vector2D) -> Vector2D {
			return .init(x: tangent.x,
						 y: -tangent.y)
		}

		func transform(semiTangent: Vector2D) -> Vector2D {
			return .init(x: -semiTangent.x,
						 y: semiTangent.y)
		}


		let newControlPoints = controlPoints
			.reversed()
			.map { controlPoint -> ControlPoint in
				switch controlPoint {

				case let .point(point):
					return .point(transform(point: point))

				case let .tangent(point, tangent):
					return .tangent(point: transform(point: point),
									tangent: transform(tangent: tangent))

				case let .semiTangents(point, left, right):
					return .semiTangents(point: transform(point: point),
										 left: transform(semiTangent: right),
										 right: transform(semiTangent: left))
				}
			}

		return Function(controlPoints: newControlPoints)!
	}

	/// Creates a function that is the horizontal symetric
	public func horizontalSymetric(y: Double) -> Function {

		let y_min = controlPoints.first!.point.y
		let y_max = controlPoints.last!.point.y


		func transform(point: Vector2D) -> Vector2D {
			return .init(x: point.x,
						 y: 2 * y - point.y)
		}

		func transform(tangent: Vector2D) -> Vector2D {
			return .init(x: tangent.x,
						 y: -tangent.y)
		}

		func transform(semiTangent: Vector2D) -> Vector2D {
			return .init(x: semiTangent.x,
						 y: -semiTangent.y)
		}


		let newControlPoints = controlPoints
			.reversed()
			.map { controlPoint -> ControlPoint in
				switch controlPoint {

				case let .point(point):
					return .point(transform(point: point))

				case let .tangent(point, tangent):
					return .tangent(point: transform(point: point),
									tangent: transform(tangent: tangent))

				case let .semiTangents(point, left, right):
					return .semiTangents(point: transform(point: point),
										 left: transform(semiTangent: left),
										 right: transform(semiTangent: right))
				}
			}

		return Function(controlPoints: newControlPoints)!
	}

}
