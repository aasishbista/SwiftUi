//
//  HypnogramView.swift
//  ORTDemo
//
//  Created by ebpearls on 08/05/2023.
//

import SwiftUI
import Charts


struct HypnogramView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hypnogram")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16,weight: .black))
                Spacer()

            }
            .padding(.vertical)
            // MARK: - green to orange as it gets taller
            ScrollView(.horizontal, showsIndicators: false){
                ZStack {
                    Chart {
                        ForEach(oxygenLevels) { oxygenLevel in
                            LineMark(x: .value("Days", oxygenLevel.date, unit: .month), y: .value("Heart Rate", oxygenLevel.heartRate))
                                .foregroundStyle(Color.accentColor.gradient)
                            
                                .cornerRadius(4)
                                .interpolationMethod(.stepCenter)
                            RectangleMark(x: .value("Days", oxygenLevel.date, unit: .month), y: .value("Heart Rate", oxygenLevel.heartRate))
                                .foregroundStyle(Color.accentColor.gradient)
                                .cornerRadius(4)
                                .interpolationMethod(.stepEnd)
                            
                        }
                    }
                    .frame(width: 400, height: 150)
                    .chartYScale(domain: 0...100)
                    
                    .chartXAxis{
                        AxisMarks(values: oxygenLevels.map {$0.date}){date in
                            AxisValueLabel(format: .dateTime.month())
                        }
                    }
                    .padding(.top, 10)
                    .chartYAxis{
                        AxisMarks(position: .leading, values: .automatic(desiredCount: 4)) {
                            let value = $0.as(Int.self)!
                            AxisValueLabel{
                                if value == 0 {
                                    Text("Deep")
                                }
                                Text("\(value)")
                            }
                        }
                    }
                    ZStack {
                        VStack(spacing: 20){
                            ForEach(0..<5, id: \.self) { item in
                                Rectangle()
                                    .fill(
                                        Color.gray.opacity(0.1))
                                    .frame(width: 315, height: 11)
                            }
                            
                        }
                        //                    Chart {
                        //                        ForEach(oxygenLevels) { oxygenLevel in
                        //                            RectangleMark(x: .value("Days", oxygenLevel.date, unit: .month), y: .value("Heart Rate", oxygenLevel.heartRate))
                        //                                .foregroundStyle(Color.accentColor.gradient)
                        //
                        //                                .cornerRadius(4)
                        //                                .interpolationMethod(.stepEnd)
                        //                        }
                        //                    }
                        //                    .frame(height: 150)
                        //                    .chartYScale(domain: 0...106)
                        //                    .chartXAxis{
                        //                        AxisMarks(values: oxygenLevels.map {$0.date}){date in
                        //                            AxisValueLabel{
                        //
                        //                            }
                        //                        }
                        //                    }
                        //                    .chartYAxis{
                        //                        AxisMarks(position: .leading) {
                        //                            let _ = $0.as(Int.self)!
                        //                            AxisValueLabel{
                        //
                        //                            }
                        //                        }
                        //                }
                    }
                    
                    
                }
            }
        }
    }
}

struct HypnogramView_Previews: PreviewProvider {
    static var previews: some View {
        HypnogramView()
    }
}
