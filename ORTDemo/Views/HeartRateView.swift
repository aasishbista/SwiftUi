//
//  HeartRateView.swift
//  ORTDemo
//
//  Created by ebpearls on 05/05/2023.
//

import SwiftUI
import Charts

struct HeartRateView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Heart Rate over day")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16,weight: .black))
                Spacer()
                Text("71 BPM avg")

            }
            .padding(.vertical)
            // MARK: - green to orange as it gets taller
            Chart {
                ForEach(heartRates) { heartRate in
                    LineMark(x: .value("Days", heartRate.date, unit: .month), y: .value("Heart Rate", heartRate.heartRate))
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
                AxisMarks(values: heartRates.map {$0.date}){date in
                    AxisValueLabel(format: .dateTime.hour())
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
        }
    }
}

struct HeartRateView_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateView()
            .padding()
    }
}
