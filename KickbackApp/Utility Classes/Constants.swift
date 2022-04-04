//
//  Constants.swift
//  KickbackApp
//
//  Created by Joga Singh on 01/04/22.
//

import Foundation

typealias JSONDictionary = [String: Any]
var bookingManager = BookingClassesManager.shared


/// Following enum consist keys, Used for save the data in User default
enum UserDefaultKeys: String {
    case userType = "userType"
    case bookingClasses = "BookingClasses"
    
    var value: String {
        return self.rawValue
    }
}


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


var studios: [String] = [
    "Sukka Fitness",
    "Tough Madder MMA",
    "Kung Fu Dojo",
    "Ufc Wfa",
    "The Edge MMA",
    "Jiu-Jitsu Valhalla",
    "Karate-It-Up",
    "Spartan Hills",
    "Kombat London"
]

var classType: [String] = [
"Upper Body",
"Full Body",
"Lower Body",
"Cardio",
"Strength",
"HIIT"
]
