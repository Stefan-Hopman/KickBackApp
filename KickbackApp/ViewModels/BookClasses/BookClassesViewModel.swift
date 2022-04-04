//
//  BookClassesViewModel.swift
//  KickbackApp
//
//  Created by Joga Singh on 03/04/22.
//

import Foundation

class BookClassesViewModel: ObservableObject {
    var slots: [TimeSlotItem] = TimeSlotItem.items
    
    var selectedDate: Date?
    
    var studioList:[String] {
        studios
    }
    
    var classTypeList:[String] {
        classType
    }
//    var studios: [String] = [
//        "Sukka Fitness",
//        "Tough Madder MMA",
//        "Kung Fu Dojo",
//        "Ufc Wfa",
//        "The Edge MMA",
//        "Jiu-Jitsu Valhalla",
//        "Karate-It-Up",
//        "Spartan Hills",
//        "Kombat London"
//    ]
//    
//    var classType: [String] = [
//    "Upper Body",
//    "Full Body",
//    "Lower Body",
//    "Cardio",
//    "Strength",
//    "HIIT"
//    ]
    
    init() {
        
    }
    
}
