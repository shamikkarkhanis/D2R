//
//  DateItem.swift
//  Dates2Remember
//
//  Created by Shamik Karkhanis on 6/3/24.
//

import Foundation

// Integrate sms reminder system here :()

struct EventItem: Codable, Identifiable {
    let id: String?
    let title: String
    let date: TimeInterval
    let freq: Int // current prop: 0 -> daily, 1 -> weekly, 2 -> monthly, 3 -> yearly
    let createDate: TimeInterval
    
}
