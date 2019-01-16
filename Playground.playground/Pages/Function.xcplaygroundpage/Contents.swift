/*:
 ## `Function`
 Math function defined by control points
 */

import SwiftXtend
import UIKit

/*:
 ### `init(controlPoints:)`
 Creates a function from control points
 */

let function = Function(controlPoints: [
    .point(.init(x: 0, y: 0)),
    .tangent(point: .init(x: 3, y: 4), tangent: .init(x: 2, y: -1.5)),
    .semiTangents(point: .init(x: 6, y: 7), left: .init(x: -2, y: -2), right: .init(x: 2, y: -2)),
    .point(.init(x: 10, y: 10)),
])!

function

/*:
 ### `linear`, `sineIn`, `sineOut`, `sineInOut`...
 Some default functions, intended to be used for easing
 */

let backIn = Function.backIn

let bounceIn = Function.bounceIn

let elasticInOut = Function.elasticInOut


/*:
 ### `f(_:)`
 Gets function image of a value
 */

let f_3 = function.f(3)
let f_5 = function.f(4)
let f_6 = function.f(6)

/*:
 ### `domain`
 Domain on which function is defined
 */

let domain = function.domain

/*:
 ### `maxima()`
 Points where y is the maximum of the function
 */

let maxima = function.maxima()

/*:
 ### `minima()`
 Points where y is the minimum of the function
 */

let minima = function.minima()

/*:
 ### `centralSymetric(through:)`
 Creates a function that is the central symetric
 */

let centralSymetric = function.centralSymetric(through: .init(x: 5, y: 5))

/*:
 ### `verticalSymetric(x:)`
 Creates a function that is the vertical symetric
 */

let verticalSymetric = function.verticalSymetric(x: 5)

/*:
 ### `horizontalSymetric(y:)`
 Creates a function that is the horizontal symetric
 */

let horizontalSymetric = function.horizontalSymetric(y: 5)




extension Function: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        let view = View()
        view.frame.size = .init(width: 400, height: 400)
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.function = self
        return view
    }
}

class View: UIView {

    var function = Function.sineIn

    override func draw(_ bounds: CGRect) {
        super.draw(bounds)

        let width = bounds.width
        let height = bounds.height
        let unit = bounds.width / 2.5

        let context = UIGraphicsGetCurrentContext()!
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -height / 2)

        context.setLineWidth(4)
        context.setStrokeColor(#colorLiteral(red: 0.1295647486, green: 0.4194544681, blue: 1, alpha: 1))

        // X Axis
        context.move(to: .zero)
        context.addLine(to: .init(x: width, y: 0))
        context.strokePath()

        // Y Axis
        context.move(to: .zero)
        context.addLine(to: .init(x: 0, y: width))
        context.strokePath()

        // Y = 1 Axis
        context.setLineDash(phase: 0, lengths: [4])
        context.setStrokeColor(#colorLiteral(red: 0.3818001089, green: 0.5877549039, blue: 1, alpha: 1))
        context.move(to: .init(x: 0, y: unit))
        context.addLine(to: .init(x: width, y: unit))
        context.strokePath()

        // Function
        context.setLineDash(phase: 0, lengths: [])
        context.setLineJoin(.round)
        context.setLineCap(.round)
        context.setLineWidth(3)
        context.setStrokeColor(#colorLiteral(red: 0.8264683315, green: 0.1058564283, blue: 0.0803070312, alpha: 1))

        var isFirst = true
        let lowerBound = function.domain.lowerBound
        let upperBound = function.domain.upperBound
        let scale = Double(unit) / upperBound
        stride(from: lowerBound, through: upperBound, by: 0.01)
            .map { CGPoint(x: $0 * scale, y: function.f($0) * scale) }
            .forEach {
                if isFirst.swap(false) { context.move(to: $0) }
                else { context.addLine(to: $0) }
            }
        context.strokePath()

    }
}

//: [Next](@next)
