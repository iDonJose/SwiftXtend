/*:
 ## `Vetor2D`
 A 2D vector representation
 */

import SwiftXtend
import UIKit

/*:
 ### `init(x:y:)`
 Initialize with x & y values
 > See also `init()`, `zero`, `one`
 */

let vector = Vector2D(x: 3, y: -8)

/*:
 ### `norm`
 Vector's norm
 */

let norm = vector.norm

/*:
 ### `normed()`
 A new vector derived from vector, with normal norm
 */

let normedVector = vector.normed()

/*:
 ### `angle(to:)`
 Calculates angle from one vector to another
 */

let bisector = Vector2D.one
let angleFromBisector = bisector.angle(to: vector)

/*:
 ### `rotating(by:)`
 Rotates vector by a given angle
 */

let tiltedVector = vector.rotating(by: .pi / 6)


let view = View()
view.frame.size = .init(width: 400, height: 400)
view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
view


class View: UIView {
    override func draw(_ bounds: CGRect) {
        super.draw(bounds)

        let vectorScale = Double(bounds.width / 20)

        let width = bounds.width
        let height = bounds.height

        let context = UIGraphicsGetCurrentContext()!
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: width / 2, y: -height / 2)

        context.setLineDash(phase: -2, lengths: [4])
        context.setLineWidth(2)
        context.setStrokeColor(#colorLiteral(red: 0.2642025972, green: 0.2669742817, blue: 0.2757742746, alpha: 1))

        // X Axis
        context.move(to: .init(x: -width / 2, y: 0))
        context.addLine(to: .init(x: width, y: 0))
        context.strokePath()

        // Y Axis
        context.move(to: .init(x: 0, y: -width / 2))
        context.addLine(to: .init(x: 0, y: width))
        context.strokePath()

        // Vector
        context.setStrokeColor(#colorLiteral(red: 0.1444277711, green: 0.2602926596, blue: 0.8879394531, alpha: 1))
        context.setLineDash(phase: 0, lengths: [])
        context.move(to: .zero)
        context.addLine(to: (vector * vectorScale).to.cgPoint)
        context.strokePath()

        // Normed Vector
        context.setStrokeColor(#colorLiteral(red: 0.8879394531, green: 0.1695449912, blue: 0.06915461067, alpha: 1))
        context.setLineWidth(4)
        context.move(to: .zero)
        context.addLine(to: (normedVector * vectorScale).to.cgPoint)
        context.strokePath()

        // Tilted Vector
        context.setStrokeColor(#colorLiteral(red: 0.3670095132, green: 0.8879394531, blue: 0.2946803311, alpha: 1))
        context.setLineWidth(2)
        context.move(to: .zero)
        context.addLine(to: (tiltedVector * vectorScale).to.cgPoint)
        context.strokePath()

    }
}

//: < [Summary](Summary) | [Next](@next) >
