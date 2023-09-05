//
//  Constant.swift
//  ORTDemo
//
//  Created by ebpearls on 05/05/2023.
//

import Foundation
import SwiftUI


let viewMonths: [ViewMonth] = [.init(date: Date.from(year: 2023, month: 1, day: 1), viewCount: 2),
                               .init(date: Date.from(year: 2023, month: 2, day: 1), viewCount: 5),
                               .init(date: Date.from(year: 2023, month: 3, day: 1), viewCount: 7),
                               .init(date: Date.from(year: 2023, month: 4, day: 1), viewCount: 8),
                               .init(date: Date.from(year: 2023, month: 5, day: 1), viewCount: 11),
                               .init(date: Date.from(year: 2023, month: 6, day: 1), viewCount: 12),
                               .init(date: Date.from(year: 2023, month: 7, day: 1), viewCount: 10),
                               .init(date: Date.from(year: 2023, month: 8, day: 1), viewCount: 5),
                               .init(date: Date.from(year: 2023, month: 9, day: 1), viewCount: 15),
                               .init(date: Date.from(year: 2023, month: 10, day: 1), viewCount: 14),
                               .init(date: Date.from(year: 2023, month: 11, day: 1), viewCount: 13),
                               .init(date: Date.from(year: 2023, month: 12, day: 1), viewCount: 12),
                               
                               
]

let heartRates: [HeartRate] = [.init(date: Date.fromHr(year: 2023, month: 1, day: 1, hr: 2), hour: 2, heartRate: 50),
                               .init(date: Date.fromHr(year: 2023, month: 2, day: 1, hr: 4), hour: 4, heartRate: 75),
                               .init(date: Date.fromHr(year: 2023, month: 3, day: 1, hr: 6),hour: 6, heartRate: 98),
                               .init(date: Date.fromHr(year: 2023, month: 4, day: 1, hr: 8), hour: 8, heartRate: 35),
                               .init(date: Date.fromHr(year: 2023, month: 5, day: 1, hr: 10), hour: 10, heartRate: 50),
                               .init(date: Date.fromHr(year: 2023, month: 6, day: 1, hr: 12), hour: 12, heartRate: 16),
                               .init(date: Date.fromHr(year: 2023, month: 7, day: 1, hr: 16), hour: 4, heartRate: 81),
                           ]

let oxygenLevels: [HeartRate] = [.init(date: Date.from(year: 2023, month: 1, day: 1), heartRate: 50),
                               .init(date: Date.from(year: 2023, month: 2, day: 1), heartRate: 75),
                               .init(date: Date.from(year: 2023, month: 3, day: 1), heartRate: 48),
                               .init(date: Date.from(year: 2023, month: 4, day: 1), heartRate: 71),
                               .init(date: Date.from(year: 2023, month: 5, day: 1), heartRate: 47),
                               .init(date: Date.from(year: 2023, month: 6, day: 1), heartRate: 76),
                               .init(date: Date.from(year: 2023, month: 7, day: 1), heartRate: 50),
                           ]


let heartRateVariabilities: [HeartRate] = [.init(date: Date.from(year: 2023, month: 1, day: 1), heartRate: 60),
                               .init(date: Date.from(year: 2023, month: 2, day: 1), heartRate: 11),
                               .init(date: Date.from(year: 2023, month: 3, day: 1), heartRate: 78),
                               .init(date: Date.from(year: 2023, month: 4, day: 1), heartRate: 10),
                               .init(date: Date.from(year: 2023, month: 5, day: 1), heartRate: 80),
                               .init(date: Date.from(year: 2023, month: 6, day: 1), heartRate: 21),
                               .init(date: Date.from(year: 2023, month: 7, day: 1), heartRate: 76),
                                         .init(date: Date.from(year: 2023, month: 8, day: 1), heartRate: 11),
                                         .init(date: Date.from(year: 2023, month: 9, day: 1), heartRate: 0),
                                         .init(date: Date.from(year: 2023, month: 10, day: 1), heartRate: 79),
                                         .init(date: Date.from(year: 2023, month: 11, day: 1), heartRate: 10),
                                         .init(date: Date.from(year: 2023, month: 12, day: 1), heartRate: 77),
                                         ]


let pressureOverTimes: [HeartRate] = [.init(date: Date.from(year: 2023, month: 1, day: 1), heartRate: 50),
                               .init(date: Date.from(year: 2023, month: 2, day: 1), heartRate: 75),
                               .init(date: Date.from(year: 2023, month: 3, day: 1), heartRate: 98),
                               .init(date: Date.from(year: 2023, month: 4, day: 1), heartRate: 35),
                               .init(date: Date.from(year: 2023, month: 5, day: 1), heartRate: 50),
                               .init(date: Date.from(year: 2023, month: 6, day: 1), heartRate: 16),
                               .init(date: Date.from(year: 2023, month: 7, day: 1), heartRate: 81),
                                     .init(date: Date.from(year: 2023, month: 8, day: 1), heartRate: 20),
                                                                    .init(date: Date.from(year: 2023, month: 9, day: 1), heartRate: 15),
                                                                    .init(date: Date.from(year: 2023, month: 10, day: 1), heartRate: 78),
                                                                    .init(date: Date.from(year: 2023, month: 11, day: 1), heartRate: 35),
                                                                    .init(date: Date.from(year: 2023, month: 12, day: 1), heartRate: 50),
                               ]
