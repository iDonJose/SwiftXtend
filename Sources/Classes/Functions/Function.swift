//
//  Function.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 06/12/2018.
//

// Source : https://github.com/agens-no/AGGeometryKit/blob/master/AGGeometryKit/AGKMath.m

// swiftlint:disable type_body_length


public struct Function {

	/// Control points
	public let controlPoints: [ControlPoint]


	// MARK: - Initialize

	public init?(controlPoints: [ControlPoint]) {
		self.controlPoints = controlPoints.uniquing { $0.x == $1.x }
        if controlPoints.count < 2 { return nil }
	}



	// MARK: - Methods

    /// Sorts control points
    public func sorted() -> Function {
        let controlPoints = self.controlPoints.sorted { $0.x < $1.x }
        return Function(controlPoints: controlPoints)!
    }


	public func f(_ x: Double) -> Double {

		guard controlPoints.isNotEmpty else { return 0 }

		guard x > controlPoints.first!.x else { return controlPoints.first!.y }
		guard x < controlPoints.last!.x else { return controlPoints.last!.y }


		var a = 0
		var b = controlPoints.count - 1

		while b - a > 1 {
			let m = (controlPoints[a].x + controlPoints[b].x) / 2
			if x > m { a = (a + b) / 2 }
			else { b = (a + b) / 2 }
		}

		let cpA = controlPoints[a]
		let cpB = controlPoints[b]


		if case let (.point(A), .point(B)) = (cpA, cpB) {

			let t = (x - A.x) / (B.x - A.x)
			return A.y + (B.y - A.y) * t
		}


        let cp1 = cpA.point
        let cp2 = cp1 + cpA.rightTangent
        let cp4 = cpB.point
        let cp3 = cp4 + cpB.leftTangent

		let t = Function.t(for: x, cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)
		let y = Function.y(t: t, cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)

		return y
	}

    /// Maximum points on curve
    public func maxima() -> [Vector2D] {

        guard controlPoints.isNotEmpty else { return [] }

        return zip(controlPoints.dropLast(), controlPoints.dropFirst())
            .map { cpA, cpB -> Vector2D in

                if case let (.point(A), .point(B)) = (cpA, cpB) {
                    return A.y < B.y ? B : A
                }
                else {

                    let cp1 = cpA.point
                    let cp2 = cp1 + cpA.rightTangent
                    let cp4 = cpB.point
                    let cp3 = cp4 + cpB.leftTangent

                    let t = Function.t_max(cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)
                    let x = Function.x(t: t, cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)
                    let y = Function.y(t: t, cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)

                    return Vector2D(x: x, y: y)
                }
            }
            .reduce([], { points, point -> [Vector2D] in
                if let first = points.first {
                    if point.y > first.y { return [point] }
                    else if first.y > point.y { return points }
                    else {
                        var newPoints = points
                        newPoints.append(point)
                        return newPoints
                    }
                }
                else {
                    return [point]
                }
            })

    }

    /// Minimum points on curve
    public func minima() -> [Vector2D] {

        guard controlPoints.isNotEmpty else { return [] }

        return zip(controlPoints.dropLast(), controlPoints.dropFirst())
            .map { cpA, cpB -> Vector2D in

                if case let (.point(A), .point(B)) = (cpA, cpB) {
                    return A.y < B.y ? A : B
                }
                else {

                    let cp1 = cpA.point
                    let cp2 = cp1 + cpA.rightTangent
                    let cp4 = cpB.point
                    let cp3 = cp4 + cpB.leftTangent

                    let t = Function.t_min(cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)
                    let x = Function.x(t: t, cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)
                    let y = Function.y(t: t, cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)

                    return Vector2D(x: x, y: y)
                }
            }
            .reduce([], { points, point -> [Vector2D] in
                if let first = points.first {
                    if first.y < point.y { return points }
                    else if point.y < first.y { return [point] }
                    else {
                        var newPoints = points
                        newPoints.append(point)
                        return newPoints
                    }
                }
                else {
                    return [point]
                }
            })

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
    public func verticalSymetric(through x: CGFloat) -> Function {

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
    public func horizontalSymetric(through y: CGFloat) -> Function {

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



	// MARK: - Helpers

    private static func x(t: Double,
                          cp1: Vector2D,
                          cp2: Vector2D,
                          cp3: Vector2D,
                          cp4: Vector2D) -> Double {

        let A = cp4.x - 3 * cp3.x + 3 * cp2.x - cp1.x
        let B = 3 * cp3.x - 6 * cp2.x + 3 * cp1.x
        let C = 3 * cp2.x - 3 * cp1.x
        let D = cp1.x

        return A * pow(t, 3) + B * pow(t, 2) + C * t + D

    }

	private static func y(t: Double,
						  cp1: Vector2D,
						  cp2: Vector2D,
						  cp3: Vector2D,
						  cp4: Vector2D) -> Double {

		let E = cp4.y - 3 * cp3.y + 3 * cp2.y - cp1.y
		let F = 3 * cp3.y - 6 * cp2.y + 3 * cp1.y
		let G = 3 * cp2.y - 3 * cp1.y
		let H = cp1.y

		return E * pow(t, 3) + F * pow(t, 2) + G * t + H

	}

	private static func t(for x: Double,
						  cp1: Vector2D,
						  cp2: Vector2D,
						  cp3: Vector2D,
						  cp4: Vector2D) -> Double {

		// Newton–Raphson Method

		let A = cp4.x - 3 * cp3.x + 3 * cp2.x - cp1.x
		let B = 3 * cp3.x - 6 * cp2.x + 3 * cp1.x
		let C = 3 * cp2.x - 3 * cp1.x
		let D = cp1.x

		var t = x

		for _ in (0..<5) {

			let x_current = A * pow(t, 3) + B * pow(t, 2) + C * t + D
			let DxDt = 3 * A * pow(t, 2) + 2 * B * t + C

            guard DxDt != 0 else { break }

			let t_previous = t

			t += (x - x_current) / DxDt
			t = t.in(0, 1)

			if abs(t - t_previous) < 0.001 { break }
		}

		return t
	}

    private static func t_max(cp1: Vector2D,
                              cp2: Vector2D,
                              cp3: Vector2D,
                              cp4: Vector2D) -> Double {

        let E = cp4.y - 3 * cp3.y + 3 * cp2.y - cp1.y
        let F = 3 * cp3.y - 6 * cp2.y + 3 * cp1.y
        let G = 3 * cp2.y - 3 * cp1.y

        let a = 3 * E
        let b = 2 * F
        let c = G

        let det = pow(b, 2) - 4 * a * c

        if det < 0 {
            return cp1.y < cp4.y ? 1 : 0
        }
        else if det == 0 {

            let t = (-b / (2 * a)).in(0, 1)
            let y = Function.y(t: t, cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)

            return cp1.y < y && cp4.y < y
                ? t
                : cp1.y < cp4.y ? 1 : 0

        }
        else {

            let t_1 = ((-b - sqrt(det)) / (2 * a)).in(0, 1)
            let t_2 = ((-b + sqrt(det)) / (2 * a)).in(0, 1)
            let y_1 = Function.y(t: t_1, cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)
            let y_2 = Function.y(t: t_2, cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)

            return cp1.y < y_1 && cp4.y < y_1 && y_2 < y_1
                ? t_1
                : cp1.y < y_2 && cp4.y < y_2
                ? t_2
                : cp1.y < cp4.y ? 1 : 0

        }

    }

    private static func t_min(cp1: Vector2D,
                              cp2: Vector2D,
                              cp3: Vector2D,
                              cp4: Vector2D) -> Double {

        let E = cp4.y - 3 * cp3.y + 3 * cp2.y - cp1.y
        let F = 3 * cp3.y - 6 * cp2.y + 3 * cp1.y
        let G = 3 * cp2.y - 3 * cp1.y

        let a = 3 * E
        let b = 2 * F
        let c = G

        let det = pow(b, 2) - 4 * a * c

        if det < 0 {
            return cp1.y < cp4.y ? 0 : 1
        }
        else if det == 0 {

            let t = (-b / (2 * a)).in(0, 1)
            let y = Function.y(t: t, cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)

            return y < cp1.y && y < cp4.y
                ? t
                : cp1.y < cp4.y ? 0 : 1

        }
        else {

            let t_1 = ((-b - sqrt(det)) / (2 * a)).in(0, 1)
            let t_2 = ((-b + sqrt(det)) / (2 * a)).in(0, 1)
            let y_1 = Function.y(t: t_1, cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)
            let y_2 = Function.y(t: t_2, cp1: cp1, cp2: cp2, cp3: cp3, cp4: cp4)

            return y_1 < cp1.y && y_1 < cp4.y && y_1 < y_2
                ? t_1
                : y_2 < cp1.y && y_2 < cp4.y
                ? t_2
                : cp1.y < cp4.y ? 0 : 1

        }

    }



	// MARK: - Types

	public enum ControlPoint {

		case point(Vector2D)
		case tangent(point: Vector2D, tangent: Vector2D)
		case semiTangents(point: Vector2D, left: Vector2D, right: Vector2D)


		/// Point
		public var point: Vector2D {
			switch self {
			case let .point(point),
				 let .tangent(point, _),
				 let .semiTangents(point, _, _):
				return point
			}
		}

		/// X value
		public var x: Double {
			return point.x
		}

		/// Y value
		public var y: Double {
			return point.y
		}

        /// Left tangent
        public var leftTangent: Vector2D {
            switch self {
            case .point: return .zero
            case let .tangent(_, tangent): return -tangent
            case let .semiTangents(_, tangent, _): return tangent
            }
        }

        /// Right tangent
        public var rightTangent: Vector2D {
            switch self {
            case .point: return .zero
            case let .tangent(_, tangent): return tangent
            case let .semiTangents(_, _, tangent): return tangent
            }
        }

	}

}
