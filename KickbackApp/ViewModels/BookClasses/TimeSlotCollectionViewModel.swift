//
//  TimeSlotCollectionViewModel.swift
//  KickbackApp
//
//  Created by Joga Singh on 03/04/22.
//

import Foundation
import SwiftUI

final class TimeSlotCollectionViewModel: ObservableObject {
    var slots: [TimeSlotItem] = TimeSlotItem.items
    
    var selectedStudio: String? {
        didSet {
            setPreferences()
        }
    }
    var selectedDate: String? {
        didSet {
            setPreferences()
        }
    }
    
    init() {
        
    }
    
    func setPreferences() {
        
    }
    
}
