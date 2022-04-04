//
//  TimeSlotItem.swift
//  KickbackApp
//
//  Created by Joga Singh on 03/04/22.
//

import Foundation

struct TimeSlotItem: Identifiable, Hashable {
    var id = UUID()
    let title: TimeSlots
}

extension TimeSlotItem {
    static var items: [TimeSlotItem] = [.init(title: .first), .init(title: .second), .init(title: .third), .init(title: .four), .init(title: .five), .init(title: .six)]
}
