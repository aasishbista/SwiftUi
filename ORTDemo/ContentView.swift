//
//  ContentView.swift
//  ORTDemo
//
//  Created by ebpearls on 05/05/2023.
//

import SwiftUI
import Charts


struct ContentView: View {
    
    
    var body: some View {

        VStack{ ScrollView(.vertical, showsIndicators: false){
//            // MARK: - Daily bar graph View
            DailyBarView()
//            // MARK: - Monthly average Bar Graph
            MonthlyAverageView()
//            // MARK: - heart Rate Line Chart View
            HeartRateView()
//            // MARK: - oxygen level Line Chart View
            OxygenLevelView()
//            // MARK: - heart Rate variability View
            HeartRateVariabilityView()
//            // MARK: - Hypnogram Rectangle Mark View
                                HypnogramView()
            Group {
                LottieView(name: "monocolor")
                    .frame(width: 124, height: 124)
                BatteryMeterView()
                SeekBarView()
//                Group {
//                    PressureOverTimeView()
//                    ScoresOverTimeView()
//                }
            }
        }
        .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14")
    }
}
