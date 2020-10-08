//
//  Alarm.swift
//  CRONAlarmClock
//
//  Created by Zachary Churchill on 9/30/20.
//

import UIKit

enum Period: String {
    case PM = "PM"
    case AM = "AM"
}

class Alarm: Equatable {
    var time: String
    var period: Period
    var description: String?
    var isActive: Bool
    
    init(time: String,
         period: Period,
         description: String? = "",
         isActive: Bool = true) {
        self.time = time
        self.period = period
        self.description = description
        self.isActive = isActive
    }
    
    convenience init() {
        // Provide an example
        self.init(time: "7:15", period: Period.AM, description: "work week", isActive: true)
    }
    
    static func ==(lhs: Alarm, rhs: Alarm) -> Bool {
        return lhs.time == rhs.time
            && lhs.period == rhs.period
            && lhs.description == rhs.description
            && lhs.isActive == rhs.isActive
    }
}