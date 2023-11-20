import SwiftUI
import CoreGraphics

struct Pie: Shape {
    var startAngle: Angle = .zero
    let finalAngle: Angle
    let clockwise:Bool
    
    func path(in rect: CGRect) -> Path {
        let startAngle: Angle = startAngle - .degrees(90)
        let finalAngle: Angle = finalAngle - .degrees(90)
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius=min(rect.width, rect.height)/2
        let start = CGPoint(
            x: center.x+radius*cos(startAngle.radians),
            y: center.y+radius*sin(startAngle.radians)
        )
        var p=Path(
        )
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: finalAngle, clockwise: clockwise)
        p.addLine(to: center)
        return p
    }
}
