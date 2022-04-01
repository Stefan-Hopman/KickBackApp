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
