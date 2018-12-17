//
//  Function+Transformations.swift
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


	/// Generates a new Function that is the central symetric of this one
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

	/// Generates a new Function that is the vertical axial symetric of this one
	public func verticalSymetric(through x: Double) -> Function {

		let x_min = controlPoints.first!.point.x
		let x_max = controlPoints.last!.point.x
		let x_mid = (x_max + x_min) / 2


		func transform(point: Vector2D) -> Vector2D {
			return .init(x: 2 * x_mid - point.x,
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

	/// Generates a new Function that is the horizontal axial symetric of this one
	public func horizontalSymetric(through y: Double) -> Function {

		let y_min = controlPoints.first!.point.y
		let y_max = controlPoints.last!.point.y
		let y_mid = (y_max + y_min) / 2


		func transform(point: Vector2D) -> Vector2D {
			return .init(x: point.x,
						 y: 2 * y_mid - point.y)
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
										 left: transform(semiTangent: right),
										 right: transform(semiTangent: left))
				}
			}

		return Function(controlPoints: newControlPoints)!
	}

}
