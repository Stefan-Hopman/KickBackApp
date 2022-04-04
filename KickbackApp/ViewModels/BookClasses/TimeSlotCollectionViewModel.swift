//
//  TimeSlotCollectionViewModel.swift
//  KickbackApp
//
//  Created by Joga Singh on 03/04/22.
//

import Foundation
import SwiftUI

final class TimeSlotCollectionViewModel: ObservableObject {
    
    var slots: [TimeSlotItem] = TimeSlotItem.items
    @Published var date: Date = Date()

    /// Used to return time slots for selected event.
//    var timeSlots: [TimeSlotItem] {
//        var tSlots: [TimeSlotItem] = []
//        for var slot in slots {
//            if event.timeSlot == slot.title.value {
//                slot.color = .green
//            }
//            tSlots.append(slot)
//        }
//        return tSlots
//    }
    
}
