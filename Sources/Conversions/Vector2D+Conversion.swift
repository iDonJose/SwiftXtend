//
//  Vector2D+Conversion.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 16/01/2019.
//


#if USE_UIKIT
import UIKit


extension Vector2D {

	public var to: Converter {
		return Converter(self)
	}

}

extension Vector2D {

	public struct Converter {

		private let value: Vector2D

		fileprivate init (_ value: Vector2D) {
			self.value = value
		}


		public var cgPoint: CGPoint {
			return CGPoint(x: value.x, y: value.y)
		}

		public var cgVector: CGVector {
			return CGVector(dx: value.x, dy: value.y)
		}

	}

}
#endif
