//
//  MeterView.swift
//  ORTDemo
//
//  Created by Aashish Bista on 10/05/2023.
//

import SwiftUI

struct MeterView: View {
    // MARK: - Colors for meter View
    let colors = [Color.accentColor, Color.accentColor.opacity(0.2)]
    // MARK: - value willbe sent from here
    @Binding var progress: CGFloat
    
    var body: some View {
        VStack(spacing: 80) {
            ZStack {
                ZStack{
                    
                    Circle()
                        .trim(from: 0, to: 0.5)
                        .stroke(Color.black.opacity(0.1), lineWidth: 20)
                        .frame(width: 137, height: 137)
                    
                    Circle()
                        .trim(from: 0, to: self.setProgress())
                        .stroke(AngularGradient(gradient: .init(colors: colors), center: .center, angle: .init(degrees: 180)), lineWidth: 20)
                        .frame(width: 137, height: 137)
                }
                .rotationEffect(.init(degrees: 180))
                
                ZStack(alignment: .bottom){
                    Circle().fill(
                    colors[0]
                        .opacity(0.9))
                        .frame(width: 11, height: 15)
                        .offset(y: 5)
                LinearGradient(
                            gradient: Gradient (
                                colors: [
                                    colors[1], colors[0]
                                ]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(width: 11, height: 45)
                        .clipShape(IndicatorShape())
                    
                    
                }
                .offset(y: -35)
                .rotationEffect(.init(degrees: -90))
                .rotationEffect(.init(degrees: setArrow()))
            }
            .padding(.bottom, -140)
            withAnimation(.linear){
                Text("\(Int(progress)) Bpm")
            }
            
        }
    }
    
    private func setProgress() -> CGFloat {
        let temp = self.progress / 2
        return CGFloat(temp * 0.01)
    }
    
    private func setArrow() -> Double {
        let temp = self.progress / 100
        return Double(temp * 180)
    }
}

struct MeterView_Previews: PreviewProvider {
    
    @State static var bindingValue: CGFloat = 10.0
    
    static var previews: some View {
        MeterView(progress: $bindingValue)
    }
}

