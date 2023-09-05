//
//  ScoresOverTime.swift
//  ORTDemo
//
//  Created by Aashish Bista on 18/05/2023.
//


import SwiftUI
import Charts


struct ScoresOverTimeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Your scores over time")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack {

                    Chart{
                        ForEach(pressureOverTimes){ pressure in
                            LineMark(x: .value("Days", pressure.date), y: .value("Pressure", pressure.heartRate))
                                .cornerRadius(4)
                                .interpolationMethod(.catmullRom)
                            PointMark(
                                x: .value("Wing Length", pressure.date),
                                y: .value("Wing Width", pressure.heartRate)
    
                            )
                            .foregroundStyle(
                                // MARK: - condition to show PointMark Color for low -> red, med -> yellow and high -> green
                                pressure.heartRate < 50 ? Color.red : pressure.heartRate <= 60 ? Color.yellow : Color.green
                            )
                        }
                    }
                    
                    .foregroundStyle(.blue.opacity(0.2))
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

struct ScoresOverTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresOverTimeView()
    }
}


