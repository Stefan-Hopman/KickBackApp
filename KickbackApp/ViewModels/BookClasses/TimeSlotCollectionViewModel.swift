//
//  TimeSlotCollectionViewModel.swift
//  KickbackApp
//
//  Created by Joga Singh on 03/04/22.
//

import Foundation
import SwiftUI

typealias TimeSlotArr = [TimeSlotItem]

final class TimeSlotCollectionViewModel: ObservableObject {
    var slots: [TimeSlotItem] = TimeSlotItem.items
    
    var selectedStudio: String? {
        didSet {
            setPreferences()
        }
    }
    var selectedDate: String? {
        didSet {
            setPreferences()
        }
    }
    
    @Published var isEventSelected: Bool = false
    
    @Published var selectedSlotTitle: String? {
        didSet {
            isEventSelected = selectedSlotTitle != nil
        }
    }
    
    /// Contains selected time slot.
//    init(slots: [TimeSlotItem]) {
//        self.slots = slots
//    }
    
    init(date: Date, studioName: String) {
        slots = bookingManager.getTimeSlots(date, studioName: studioName)
    }
    
    func setPreferences() {
        
    }
    
}

extension TimeSlotArr {
    
    var titles: [String] {
        var titles: [String] = []
        for slot in self {
            titles.append(slot.title.value)
        }
        return titles
    }
}
