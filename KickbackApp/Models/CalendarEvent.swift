//
//  Event.swift
//  KickbackApp
//
//  Created by AJDEVTECH on 29/03/22.
//

import Foundation

class CalendarEvent: ObservableObject{
    @Published var name = "Helsdfsflo"
    @Published var date: Date?
    @Published var studioName: String?
    @Published var timeSlot: String?
}
