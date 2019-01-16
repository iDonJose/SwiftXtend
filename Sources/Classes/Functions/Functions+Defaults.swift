//
//  Functions+Defaults.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 17/12/2018.
//

// Source : https://easings.net


extension Function {

	// MARK: Linear

	public static var linear: Function {
		return Function(controlPoints: [.point(.zero),
										.point(.one)])!
	}


	// MARK: Sine

	public static var sineIn: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.47, y: 0)),
										.tangent(point: .one,
												 tangent: .init(x: 0.255, y: 0.285))])!
	}

	public static var sineOut: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.39, y: 0.575)),
										.tangent(point: .one,
												 tangent: .init(x: 0.435, y: 0))])!
	}

	public static var sineInOut: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.445, y: 0.05)),
										.tangent(point: .one,
												 tangent: .init(x: 0.45, y: 0.05))])!
	}


	// MARK: Ease Quad

	public static var easeInQuad: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.55, y: 0.085)),
										.tangent(point: .one,
												 tangent: .init(x: 0.32, y: 0.47))])!
	}

	public static var easeOutQuad: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.25, y: 0.46)),
										.tangent(point: .one,
												 tangent: .init(x: 0.55, y: 0.06))])!
	}

	public static var easeInOutQuad: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.455, y: 0.03)),
										.tangent(point: .one,
												 tangent: .init(x: 0.485, y: 0.045))])!
	}


	// MARK: Ease Cubic

	public static var easeInCubic: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.55, y: 0.055)),
										.tangent(point: .one,
												 tangent: .init(x: 0.325, y: 0.81))])!
	}

	public static var easeOutCubic: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.215, y: 0.61)),
										.tangent(point: .one,
												 tangent: .init(x: 0.645, y: 0))])!
	}

	public static var easeInOutCubic: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.645, y: 0.045)),
										.tangent(point: .one,
												 tangent: .init(x: 0.645, y: 0))])!
	}


	// MARK: Ease Exponential

	public static var easeInExpo: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.95, y: 0.005)),
										.tangent(point: .one,
												 tangent: .init(x: 0.205, y: 0.965))])!
	}

	public static var easeOutExpo: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.19, y: 1)),
										.tangent(point: .one,
												 tangent: .init(x: 0.88, y: 0))])!
	}

	public static var easeInOutExpo: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.95, y: 0.005)),
										.tangent(point: .one,
												 tangent: .init(x: 0.88, y: 0))])!
	}


	// MARK: Back

	public static var backIn: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.6, y: -0.28)),
										.tangent(point: .one,
												 tangent: .init(x: 0.265, y: 0.955))])!
	}

	public static var backOut: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.175, y: 0.885)),
										.tangent(point: .one,
												 tangent: .init(x: 0.68, y: -0.275))])!
	}

	public static var backInOut: Function {
		return Function(controlPoints: [.tangent(point: .zero,
												 tangent: .init(x: 0.68, y: -0.55)),
										.tangent(point: .one,
												 tangent: .init(x: 0.735, y: -0.55))])!
	}


	// MARK: Elastic

	public static var elasticIn: Function {
		return Function(controlPoints: [.tangent(point: .zero, tangent: .init(x: 0.078, y: 0)),
										.tangent(point: .init(x: 0.248, y: -0.008), tangent: .init(x: 0.07, y: 0)),
										.tangent(point: .init(x: 0.392, y: 0.02), tangent: .init(x: 0.058, y: 0)),
										.tangent(point: .init(x: 0.544, y: -0.046), tangent: .init(x: 0.056, y: 0)),
										.semiTangents(point: .init(x: 0.692, y: 0.268), left: .init(x: -0.04, y: 0), right: .init(x: 0.08, y: 0)),
										.semiTangents(point: .init(x: 0.84, y: -0.36), left: .init(x: -0.046, y: 0), right: .init(x: 0.072, y: 0)),
										.semiTangents(point: .init(x: 0.992, y: 1.024), left: .init(x: -0.052, y: 0), right: .init(x: 0.007, y: 0)),
										.point(.one)])!
	}

	public static var elasticOut: Function {
		return Function(controlPoints: [.point(.zero),
										.semiTangents(point: .init(x: 0.008, y: -0.024), left: .init(x: -0.007, y: 0), right: .init(x: 0.052, y: 0)),
										.semiTangents(point: .init(x: 0.16, y: 1.36), left: .init(x: -0.072, y: 0), right: .init(x: 0.046, y: 0)),
										.semiTangents(point: .init(x: 0.308, y: 0.732), left: .init(x: -0.08, y: 0), right: .init(x: 0.04, y: 0)),
										.tangent(point: .init(x: 0.456, y: 1.046), tangent: .init(x: 0.056, y: 0)),
										.tangent(point: .init(x: 0.608, y: 0.98), tangent: .init(x: 0.058, y: 0)),
										.tangent(point: .init(x: 0.752, y: 1.008), tangent: .init(x: 0.07, y: 0)),
										.tangent(point: .one, tangent: .init(x: 0.078, y: 0))])!
	}

	public static var elasticInOut: Function {
		return Function(controlPoints: [.tangent(point: .zero, tangent: .init(x: 0.024, y: 0)),
										.tangent(point: .init(x: 0.08, y: -0.004), tangent: .init(x: 0.032, y: 0)),
										.tangent(point: .init(x: 0.168, y: 0.012), tangent: .init(x: 0.03, y: 0)),
										.tangent(point: .init(x: 0.274, y: -0.02), tangent: .init(x: 0.032, y: 0)),
										.tangent(point: .init(x: 0.35, y: 0.068), tangent: .init(x: 0.03, y: 0)),
										.tangent(point: .init(x: 0.424, y: -0.18), tangent: .init(x: 0.026, y: 0)),
										.tangent(point: .init(x: 0.576, y: 1.18), tangent: .init(x: 0.026, y: 0)),
										.tangent(point: .init(x: 0.65, y: 0.932), tangent: .init(x: 0.03, y: 0)),
										.tangent(point: .init(x: 0.726, y: 1.02), tangent: .init(x: 0.032, y: 0)),
										.tangent(point: .init(x: 0.832, y: 0.988), tangent: .init(x: 0.03, y: 0)),
										.tangent(point: .init(x: 0.92, y: 1.004), tangent: .init(x: 0.032, y: 0)),
										.tangent(point: .one, tangent: .init(x: 0.024, y: 0))])!
	}


	// MARK: Bounce

	public static var bounceIn: Function {
		return Function(controlPoints: [.point(.zero),
										.tangent(point: .init(x: 0.048, y: 0.02), tangent: .init(x: 0.04, y: 0)),
										.point(.init(x: 0.09, y: 0)),
										.tangent(point: .init(x: 0.176, y: 0.064), tangent: .init(x: 0.05, y: 0)),
										.point(.init(x: 0.272, y: 0)),
										.tangent(point: .init(x: 0.454, y: 0.252), tangent: .init(x: 0.12, y: 0)),
										.point(.init(x: 0.638, y: 0)),
										.tangent(point: .one, tangent: .init(x: 0.196, y: 0))])!
	}

	public static var bounceOut: Function {
		return Function(controlPoints: [.tangent(point: .zero, tangent: .init(x: 0.196, y: 0)),
										.point(.init(x: 0.362, y: 1)),
										.tangent(point: .init(x: 0.546, y: 0.748), tangent: .init(x: 0.12, y: 0)),
										.point(.init(x: 0.728, y: 1)),
										.tangent(point: .init(x: 0.824, y: 0.936), tangent: .init(x: 0.05, y: 0)),
										.point(.init(x: 0.91, y: 1)),
										.tangent(point: .init(x: 0.952, y: 0.98), tangent: .init(x: 0.04, y: 0)),
										.point(.one)])!
	}

	public static var bounceInOut: Function {
		return Function(controlPoints: [.point(.zero),
										.tangent(point: .init(x: 0.022, y: 0.012), tangent: .init(x: 0.012, y: 0)),
										.point(.init(x: 0.044, y: 0)),
										.tangent(point: .init(x: 0.088, y: 0.034), tangent: .init(x: 0.024, y: 0)),
										.point(.init(x: 0.136, y: 0)),
										.tangent(point: .init(x: 0.23, y: 0.128), tangent: .init(x: 0.048, y: 0)),
										.semiTangents(point: .init(x: 0.316, y: 0), left: .zero, right: .init(x: 0.1, y: 0.5)),
										.point(.init(x: 0.684, y: 1)),
										.tangent(point: .init(x: 0.77, y: 0.872), tangent: .init(x: 0.048, y: 0)),
										.point(.init(x: 0.864, y: 1)),
										.tangent(point: .init(x: 0.912, y: 0.966), tangent: .init(x: 0.024, y: 0)),
										.point(.init(x: 0.956, y: 1)),
										.tangent(point: .init(x: 0.978, y: 0.988), tangent: .init(x: 0.012, y: 0)),
										.point(.one)])!
	}

}
