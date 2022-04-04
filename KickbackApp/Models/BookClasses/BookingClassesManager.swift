//
//  BookingClassesManager.swift
//  KickbackApp
//
//  Created by Joga Singh on 01/04/22.
//

import Foundation


class BookingClassesManager {
    static let shared = BookingClassesManager()
    
    var allClasses: ClassBooking = []
    
    
    
    init() {
        fetchAllClasses()
//        if allClasses.count == 0 {
//            allClasses.append(ClassBookingElement.testBooking)
//            allClasses.append(ClassBookingElement.testBooking2)
//            save()
//        }
    }
    
    /// Contains list of all classes
    func fetchAllClasses() {
        do {
            let bookedClasses = try UserDefaults.standard.getObject(forKey: .bookingClasses, castTo: ClassBooking.self)
            print(bookedClasses)
            allClasses = bookedClasses
        } catch let error {
            print(error)
        }
    }
    
    /// Used to save all objects of the list.
    func save() {
        do {
            try UserDefaults.standard.setObject(allClasses, forKey: .bookingClasses)
        } catch let error {
            print(error)
        }
    }
    
    func add(_ classElement: ClassBookingElement) {
        allClasses.append(classElement)
        save()
    }
    
    
    func fetchEventsFor(_ currentDate: Date, studioName: String) -> [ClassBookingElement] {
        var events: [ClassBookingElement] = []
        let currentDateString: String = currentDate.toString()
        for booking in allClasses {
            if booking.studioName == studioName {
                if booking.date.toString() == currentDateString {
                    events.append(booking)
                }
            }
        }
        return events
    }
    
    func getTimeSlots(_ currentDate: Date, studioName: String) -> [TimeSlotItem] {
        let bookings = fetchEventsFor(currentDate, studioName: studioName)
        var timingsSlotArr: [TimeSlotItem] = []
        for booking in bookings {
            if let slot: TimeSlots = .init(rawValue: booking.classStartTime ?? "") {
                timingsSlotArr.append(TimeSlotItem(title: slot))
            }
        }
        return timingsSlotArr
    }
    
    
    
}
