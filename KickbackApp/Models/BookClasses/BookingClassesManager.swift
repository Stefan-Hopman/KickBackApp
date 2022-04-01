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
    
    func save() {
        
    }
    
    func add() {
        
    }
    
}
