//
//  OrbitView.swift
//  NEOs
//
//  Created by Scott Densmore on 11/25/22.
//

import SwiftUI

struct OrbitView: View {
    @State private var animationFlag = false

    var body: some View {
        let planetColor = Color(red: 0.88, green: 0.16, blue: 0.48, opacity: 1.0)
        let orbitColor = Color(red: 0.380, green: 0.906, blue: 0.878, opacity: 1.0)

        ZStack {

            Circle()
                .frame(width: 114, height: 114)
                .foregroundColor(planetColor)

            Circle()
                .stroke(orbitColor, lineWidth: 1)
                .frame(width: 182, height: 182)

            Circle()
                .stroke(orbitColor, lineWidth: 1)
                .frame(width: 234, height: 234)

            Circle()
                .fill(orbitColor)
                .frame(width: 18, height: 118)
                .modifier(self.makeOrbitEffect(
                    diameter: 182 * CGFloat(1)
                ))
                .animation(Animation
                    .linear(duration: Double.random(in: 10 ... 100))
                    .repeatForever(autoreverses: false), value: self.animationFlag
                )

            Circle()
                .fill(orbitColor)
                .frame(width: 18, height: 118)
                .modifier(self.makeOrbitEffect(
                    diameter: 234 * CGFloat(1)
                ))
                .animation(Animation
                    .linear(duration: Double.random(in: 10 ... 100))
                    .repeatForever(autoreverses: false), value: self.animationFlag
                )
        }
        .onAppear {
            self.animationFlag.toggle()
        }
    }


    func makeOrbitEffect(diameter: CGFloat) -> some GeometryEffect {
        return OrbitEffect(angle: self.animationFlag ? 2 * .pi : 0,
                           radius: diameter / 2.0)
    }
}

struct OrbitEffect: GeometryEffect {
    let initialAngle = CGFloat.random(in: 0 ..< 2 * .pi)

    var angle: CGFloat = 0
    let radius: CGFloat

    var animatableData: CGFloat {
        get { return angle }
        set { angle = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        let pt = CGPoint(x: cos(angle + initialAngle) * radius,
                         y: sin(angle + initialAngle) * radius)
        let translation = CGAffineTransform(translationX: pt.x, y: pt.y)
        return ProjectionTransform(translation)
    }
}

struct OrbitView_Previews: PreviewProvider {
    static var previews: some View {
        OrbitView()
    }
}
