//
//  ViewMonth.swift
//  ORTDemo
//
//  Created by ebpearls on 05/05/2023.
//

import Foundation


struct ViewMonth: Identifiable {
    
    var id = UUID()
    var date: Date
    var viewCount: Int
}

struct HeartRate: Identifiable {
    var id = UUID()
    var date: Date
    var hour: Int?
    var heartRate: Int
}

