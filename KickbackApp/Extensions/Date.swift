//
//  Date.swift
//  KickbackApp
//
//  Created by Joga Singh on 04/04/22.
//

import Foundation

extension Date {
    
    func toString(_ format: String = "yyyy/MM/dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
 
}
