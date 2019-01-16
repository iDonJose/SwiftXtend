//
//  CGVector+Conversion.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 16/01/2019.
//


#if USE_UIKIT
import UIKit


extension CGVector {

	public var to: Converter {
		return Converter(self)
	}

}

extension CGVector {

	public struct Converter {

		private let value: CGVector

		fileprivate init (_ value: CGVector) {
			self.value = value
		}


		public var vector2D: Vector2D {
			return Vector2D(x: Double(value.dx),
							y: Double(value.dy))
		}

	}

}
#endif
