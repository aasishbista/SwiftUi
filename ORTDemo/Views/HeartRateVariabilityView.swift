//
//  HeartRateVariabilityView.swift
//  ORTDemo
//
//  Created by ebpearls on 08/05/2023.
//

import SwiftUI
import Charts

struct HeartRateVariabilityView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Heart Rate Variability")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16,weight: .black))
                Spacer()

            }
            .padding(.vertical)
            // MARK: - green to orange as it gets taller
                Chart {
                    ForEach(heartRateVariabilities) { heartRateVariability in
                        LineMark(x: .value("Days", heartRateVariability.date, unit: .month), y: .value("Heart Rate", heartRateVariability.heartRate))
                            .foregroundStyle(Color.accentColor.gradient)

                            .cornerRadius(4)
                            .interpolationMethod(.catmullRom)
                    }
                }
                .frame(height: 150)
                .foregroundStyle(
                                    LinearGradient(
                                        gradient: Gradient (
                                            colors: [
                                                .green,
                                                .orange,
                                                .yellow,
                                                .red
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    ).blendMode(.darken)
                                )
                .chartYScale(domain: 0...106)
                
                .chartXAxis{
                    AxisMarks(values: heartRateVariabilities.map {$0.date}){date in
                        AxisValueLabel{
                            Text("01/01")
                                .font(.system(size: 8))
                                .padding(.top)
                        }
                    }
                }
                .chartYAxis{
                    AxisMarks(position: .leading) {
                        let value = $0.as(Int.self)!
                        AxisValueLabel{
                            Text("\(value)")
                        }
                    }
            }
//            LottieView(name: "Watermelon")
//                .foregroundColor(.blue)
        }
    }
}

struct HeartRateVariabilityView_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateVariabilityView()
    }
}
