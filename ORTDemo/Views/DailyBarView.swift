//
//  WeeklyBarView.swift
//  ORTDemo
//
//  Created by ebpearls on 05/05/2023.
//

import Foundation
import SwiftUI
import Charts
//
struct ValueDay {
    let value: Int
    let day: String
}

let valueDays:[ValueDay] = [ValueDay(value: 10, day: "Mon"),ValueDay(value: 4, day: "Tue"),
                            ValueDay(value: 7, day: "Wed"),ValueDay(value: 10, day: "Thurs"),
                            ValueDay(value: 8, day: "Fri"),ValueDay(value: 9, day: "Sat"),ValueDay(value: 12, day: "Sun")]

struct DailyBarView: View {
    

    var body: some View {
        VStack {
            Text("20-25 Feb\n8 hrs on Average")
                .multilineTextAlignment(.center)
                .font(.system(size: 16))
            Chart {
                ForEach(valueDays, id: \.day) { valueDay in
                   BarMark(
                    x: .value("Weekdays", valueDay.day),
                    y: .value("Value", valueDay.value),
                   width: 20)
                   .clipShape(CustomShape())
                }
                }
                .frame(height: 250)
                .foregroundColor(Color("barBlue"))
                .chartYAxis(content: {
                    AxisMarks(position: .leading)
            })
        }
    }
}

struct WeeklyBarView_Previews: PreviewProvider {
    static var previews: some View {
        DailyBarView()
    }
}





