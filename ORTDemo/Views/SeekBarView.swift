//
//  SeekBarView.swift
//  ORTDemo
//
//  Created by Aashish Bista on 10/05/2023.
//

import SwiftUI

struct SeekBarView: View {
    
    let colors = [Color("seekBarPurple"),Color("seekBarRed"),Color("seekBarYellow"), Color("seekBarGreen")]
    
    @State var moveOnCircularPath = false
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(AngularGradient(gradient: .init(colors: colors), center: .center, angle: .degrees(180)), lineWidth: 30)
                
                Circle().fill(
                    Color.white)
                .modifier(SmallCircleModifier())
                .frame(width: 22, height: 22)
                
                Circle().fill(
                    Color.accentColor)
                .modifier(SmallCircleModifier())
                .frame(width: 20, height: 20)
            }
            .frame(width: 283, height: 272)
        }
    }
}

struct SeekBarView_Previews: PreviewProvider {
    static var previews: some View {
        SeekBarView()
            .padding()
    }
}


// MARK: - SemiCircle
struct HalfCircle: InsettableShape {
    var _inset: CGFloat = 0

    func inset(by amount: CGFloat) -> Self {
        var copy = self
        copy._inset += amount
        return copy
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // This is a half-circle centered at the origin with radius 1.
        path.addArc(
            center: .zero,
            radius: 1,
            startAngle: .zero,
            endAngle: .radians(.pi),
            clockwise: false
        )
        path.closeSubpath()

        // Since it's the bottom half of a circle, we only want
        // to inset the left, right, and bottom edges of rect.
        let rect = rect
            .insetBy(dx: _inset, dy: 0.5 * _inset)
            .offsetBy(dx: 0, dy: -(0.5 * _inset))

        // This transforms bounding box of the path to fill rect.
        let transform = CGAffineTransform.identity
            .translatedBy(x: rect.origin.x + 0.5 * rect.size.width, y: 0)
            .scaledBy(x: rect.width / 2, y: rect.height)

        return path.applying(transform)
    }
}


struct SmallCircleModifier: ViewModifier {
    
    
    @State var moveOnCircularPath = false
    
    func body(content: Content) -> some View {
        content.offset(x: 135)
            .rotationEffect(.degrees(moveOnCircularPath ? 0 : 180))
            .onAppear(){
                withAnimation(.default.speed(0.05).repeatForever(autoreverses: false)){
                    self.moveOnCircularPath.toggle()
                }
            }
    }
}
