//
//  ClassBooking.swift
//  KickbackApp
//
//  Created by Joga Singh on 01/04/22.
//

//   let classBooking = try? newJSONDecoder().decode(ClassBooking.self, from: jsonData)

import Foundation

// MARK: - ClassBookingElement
struct ClassBookingElement: Codable {
    var classType, classStartTime, studioName: String?
    var date: Date
}

typealias ClassBooking = [ClassBookingElement]

extension ClassBookingElement {
    static var testBooking: ClassBookingElement = .init(classType: "Upper Body", classStartTime: "11:00 - 12:00pm", studioName: "Sukka Fitness", date: Date())
    static var testBooking2: ClassBookingElement = .init(classType: "Upper Body", classStartTime: "09:00 - 10:00am", studioName: "Sukka Fitness", date: Date())
}

extension ClassBooking {
    
    var datesArray: [String] {
        var dateValues: [String] = []
        for item in self {
            dateValues.append(item.date.toString("yyyy/MM"))    /// Used to fetch month and year only.
        }
        return dateValues
    }
}

/*
 enum ClassType : String, Codable {
     case karate = "Karate"
 }

 struct ClassName : Codable {
     var classType : ClassType
 }
 
 
 let jsonString = "{\"classType\": \"Karate\"}"
 let jsonData = Data(jsonString.utf8)
 do {
     let decoded = try JSONDecoder().decode(ClassName.self, from: jsonData)
     print(decoded)
 } catch {
     print(error)
 }
 
 */
