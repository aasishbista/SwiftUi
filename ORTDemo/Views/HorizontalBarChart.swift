//
//  HorizontalBarChart.swift
//  ORTDemo
//
//  Created by ebpearls on 19/05/2023.
//

import SwiftUI
import Charts

struct Temperature {
  let month: Int
  let min: Int
  let max: Int
  let mean: Float
}

let data: [Temperature] = [
  Temperature(month: 1, min: -3, max: 4, mean: 0.8),
  Temperature(month: 2, min: -2, max: 7, mean: 2.4),
  Temperature(month: 3, min: 2, max: 13, mean: 7.2),
  Temperature(month: 4, min: 6, max: 18, mean: 12.3),
  Temperature(month: 5, min: 11, max: 23, mean: 17.1),
  Temperature(month: 6, min: 14, max: 27, mean: 20.5),
  Temperature(month: 7, min: 16, max: 29, mean: 22.2),
  Temperature(month: 8, min: 15, max: 29, mean: 22.1),
  Temperature(month: 9, min: 11, max: 23, mean: 17.3),
  Temperature(month: 10, min: 7, max: 18, mean: 12.5),
  Temperature(month: 11, min: 3, max: 11, mean: 6.9),
  Temperature(month: 12, min: -1, max: 5, mean: 1.6),
]

struct HorizontalBarChart: View {
    var body: some View {
        Chart {
          ForEach(data, id: \.month) { temperature in
            let month = Calendar.current.date(from: DateComponents(month: temperature.month))!
            BarMark(x: .value("Month", month, unit: .month),
                    yStart: .value("Temperature", temperature.min),
                    yEnd: .value("Temperature", temperature.max),
                    width: .ratio(0.6))
              .opacity(0.3)

            RectangleMark(x: .value("Month", month, unit: .month),
                          y: .value("Temperature", temperature.mean),
                          width: .ratio(0.6),
                          height: .fixed(2))
              let average = data.map(\.mean).reduce(0.0, +) / Float(data.count)
                RuleMark(y: .value("Mean", average))
                  .foregroundStyle(.red)
                  .lineStyle(StrokeStyle(lineWidth: 2))
                  .annotation(position: .bottom, alignment: .trailing) {
                    Text("Mean: \(average, format: .number.precision(.fractionLength(1)))")
                      .font(.body.bold())
                      .foregroundStyle(.red)
                  }
          }
        }
        .chartXAxis {
          AxisMarks(values: .stride(by: .month)) { _ in
            AxisGridLine()
            AxisTick()
            AxisValueLabel(format: .dateTime.month(.abbreviated), centered: true)
          }
        }
        .chartYAxis {
          AxisMarks(values: .automatic(desiredCount: 4)) { value in
            AxisGridLine()
            AxisTick()
            AxisValueLabel {
              if let plottable = value.as(Int.self) {
                Text("\(plottable) °C")
              }
            }
          }
        }
    }
}

struct HorizontalBarChart_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalBarChart()
    }
}
