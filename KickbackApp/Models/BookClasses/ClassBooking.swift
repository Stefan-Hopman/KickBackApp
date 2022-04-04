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
    var classType, classStartTime, date, studioName: String?
    
    
}

typealias ClassBooking = [ClassBookingElement]

extension ClassBookingElement {
    
    static var testBooking: ClassBookingElement = .init(classType: "Kuwando", classStartTime: "11:00 - 12:00pm", date: "", studioName: "")
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
