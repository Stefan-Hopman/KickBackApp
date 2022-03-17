//
//  ColorExtension.swift
//  KickbackApp
//
//  Created by Stefan Hopman on 12/26/21.
//

import SwiftUI

extension Color {
    static let kGray = Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)
    static let kWhite = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let darkPink = Color(red: 213 / 255, green: 151 / 255, blue: 136 / 255)
    static let lightBlack = Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
    static let docileWhite = Color(red: 216 / 255, green: 215 / 255, blue: 218 / 255)
    
}

extension UIColor{
    static let docileWhite = UIColor(red: 216 / 255, green: 215 / 255, blue: 218 / 255, alpha: 1.0)
}


extension CGColor{
    static let darkPink = CGColor(red: 213 / 255, green: 151 / 255, blue: 136 / 255, alpha: 1.0)
    static let white = CGColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1.0)
    static let gray = CGColor(red: 213 / 255, green: 213 / 255, blue: 213 / 255, alpha: 1.0)
    static let placeHolderGray = CGColor(red: 213 / 255, green: 213 / 255, blue: 213 / 255, alpha: 0.75)
    static let lightBlack = CGColor(red: 105 / 255, green: 105 / 255, blue: 105 / 255, alpha: 1.0)
    static let docileWhite = CGColor(red: 216 / 255, green: 215 / 255, blue: 218 / 255, alpha: 1.0)
}


