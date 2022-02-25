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
}


extension CGColor{
    static let darkPink = CGColor(red: 213 / 255, green: 151 / 255, blue: 136 / 255, alpha: 1.0)
    static let white = CGColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1.0)
    static let gray = CGColor(red: 213 / 255, green: 213 / 255, blue: 213 / 255, alpha: 1.0)
    static let placeHolderGray = CGColor(red: 213 / 255, green: 213 / 255, blue: 213 / 255, alpha: 0.75)
}
