//
//  MonthlyAverageView.swift
//  ORTDemo
//
//  Created by ebpearls on 05/05/2023.
//

import SwiftUI
import Charts

struct MonthlyAverageView: View {
    var body: some View {
        VStack {
            Text("Jan-Dec 2022\n8hrs on Average")
                .multilineTextAlignment(.center)
                .font(.system(size: 16))
            // MARK: - green to orange as it gets taller
            Chart {
                ForEach(viewMonths) { viewMonth in
                    BarMark(x: .value("Months", viewMonth.date, unit: .month), y: .value("Hrs", viewMonth.viewCount))
                        .foregroundStyle(Color("barBlue").gradient)
//                                    .foregroundStyle(Color(hue: 0.3 - Double((viewMonth.viewCount/2)/5), saturation: 1, brightness: 1, opacity: 0.7))
                        .cornerRadius(4)
                        .interpolationMethod(.catmullRom)
//                                    .symbol(by: .value("Months", viewMonth.viewCount))
                }
            }
            .frame(height: 150)
            //setting the upper limit for yAXis
            .chartYScale(domain: 0...15)
            .chartXAxis{
                AxisMarks(values: viewMonths.map {$0.date}){date in
                    AxisValueLabel(format: .dateTime.month())
                }
            }
            .chartYAxis{
                AxisMarks(position: .leading) {
                    let value = $0.as(Int.self)!
                    AxisValueLabel{
                        Text("\(value)h")
                    }
                }
        }
            
        }
    }
}

struct MonthlyAverageView_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyAverageView()
    }
}
