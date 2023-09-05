//
//  DateExtension.swift
//  ORTDemo
//
//  Created by ebpearls on 05/05/2023.
//

import Foundation

extension Date {
    
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
    
    static func fromHr(year: Int, month: Int, day: Int, hr: Int?) -> Date {
        let components = DateComponents(year: year, month: month, day: day, hour: hr)
        return Calendar.current.date(from: components)!
    }
}
