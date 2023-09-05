//
//  OxygenLevelView.swift
//  ORTDemo
//
//  Created by ebpearls on 05/05/2023.
//

import SwiftUI
import Charts

struct OxygenLevelView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Blood oxygen levels")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16,weight: .black))
                Spacer()

            }
            .padding(.vertical)
            // MARK: - green to orange as it gets taller
                Chart {
                    ForEach(oxygenLevels) { oxygenLevel in
                        LineMark(x: .value("Days", oxygenLevel.date, unit: .month), y: .value("Heart Rate", oxygenLevel.heartRate))
                            .foregroundStyle(Color.accentColor.gradient)

                            .cornerRadius(4)
                            .interpolationMethod(.linear)
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
                    AxisMarks(values: oxygenLevels.map {$0.date}){date in
//                        AxisValueLabel{
//                            Text("\(Date(date))")
//                        }
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

struct OxygenLevelView_Previews: PreviewProvider {
    static var previews: some View {
        OxygenLevelView()
    }
}
