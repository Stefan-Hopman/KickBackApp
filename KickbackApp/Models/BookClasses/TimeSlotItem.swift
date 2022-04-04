//
//  TimeSlotItem.swift
//  KickbackApp
//
//  Created by Joga Singh on 03/04/22.
//

import Foundation

enum TimeSlots: String {
    case first = "09:00 - 10:00am"
    case second = "11:00 - 12:00pm"
    case third = "01:00 - 02:00pm"
    case four = "03:00 - 04:00pm"
    case five = "05:00 - 06:00pm"
    case six = "07:00 - 08:00pm"
    
    var value: String {
        rawValue
    }
}


struct TimeSlotItem: Identifiable, Hashable {
    var id = UUID()
    let title: TimeSlots
}

extension TimeSlotItem {
    static var items: [TimeSlotItem] = [.init(title: .first), .init(title: .second), .init(title: .third), .init(title: .four), .init(title: .five), .init(title: .six)]
}
