//
//  CGVector+Conversion.swift
//  SwiftXtend-iOS
//
//  Created by José Donor on 16/01/2019.
//


#if USE_UIKIT
import UIKit


extension CGVector {

	public var vector2D: Vector2D {
		return Vector2D(x: Double(dx),
						y: Double(dy))
	}

}
#endif
