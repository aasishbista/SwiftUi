//
//  BatteryMeterView.swift
//  ORTDemo
//
//  Created by ebpearls on 10/05/2023.
//

import SwiftUI

struct BatteryMeterView: View {
    
    // MARK: - Colors for text Button
    let colors = [Color("meterBlue"), Color("meterLightBlue")]
//    let colors = [Color.accentColor, Color.accentColor]
    
    @State var progress: CGFloat = 0

    
    var body: some View {
        VStack {
            MeterView(progress: self.$progress)
                .padding(.bottom, 40)
            HStack(spacing: 25) {
                Button(action: {
                    withAnimation(.default.speed(0.55)) {
                        if self.progress != 100 {
                            self.progress += 10
                            debugPrint("Progress: \(progress)")
                        }
                            
                    }
                }) {
                    Text("Update")
                        .padding(.vertical, 10)
                        .frame(width: (160))
                }
                .background(Capsule().stroke(LinearGradient(gradient: .init(colors: self.colors), startPoint: .leading, endPoint: .trailing), lineWidth: 2))
                
                Button(action: {
                    withAnimation(.default.speed(0.55)) {
                        self.progress = 0
                    }
                }) {
                    Text("Reset")
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                }
                .background(Capsule().stroke(LinearGradient(gradient: .init(colors: self.colors), startPoint: .leading, endPoint: .trailing), lineWidth: 2))
            }
            .padding(.top, 55)
        }
    }
}

struct BatteryMeterView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryMeterView()
    }
}
