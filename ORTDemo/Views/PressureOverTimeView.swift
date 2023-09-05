//
//  PressureOverTimeView.swift
//  ORTDemo
//
//  Created by Aashish Bista on 18/05/2023.
//

import SwiftUI
import Charts


struct PressureOverTimeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Pressure over time")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                Spacer()
                Text("Medium avg")
                    .font(.system(size: 16))
            }
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack {

                    Chart{
                        ForEach(pressureOverTimes){ pressure in
                            LineMark(x: .value("Days", pressure.date), y: .value("Pressure", pressure.heartRate))
                                .cornerRadius(4)
                                .interpolationMethod(.catmullRom)
                        }
                    }
                    
                    .foregroundStyle(
                        LinearGradient(gradient: Gradient(colors: [
                            .red, .yellow, .green]), startPoint: .top, endPoint: .bottom))
                    .chartXAxis{
                        AxisMarks(values: pressureOverTimes.map {$0.date}){date in
                            AxisValueLabel{
                                Text("01/01")
                            }
                        }
                    }
                    .chartYAxis{
                        AxisMarks(position: .leading) {
                            let value = $0.as(Int.self)!
                            AxisValueLabel{
                                if value == 100 {
                                    Text("High")
                                }
                                if value == 50 {
                                    Text("Med")
                                }
                                if value == 0 {
                                    Text("Low")
                                }
                            }
                        }
                    }
                } // ZStack
                .frame(width: 500, height: 180)
                .padding(.vertical)
            }
        }
        .padding(.vertical)
    }
}

struct PressureOverTimeView_Previews: PreviewProvider {
    static var previews: some View {
        PressureOverTimeView()
    }
}


extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
