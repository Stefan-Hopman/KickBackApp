//
//  CalendarView.swift
//  KickbackApp
//
//  Created by AJDEVTECH on 29/03/22.
//  https://stackoverflow.com/a/65653600

import Foundation
import FSCalendar
import UIKit
import SwiftUI

struct FSCalendarView: UIViewRepresentable {
    
    @Binding var selectedDate: Date?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        calendar.appearance.todayColor = UIColor.systemGreen
        calendar.appearance.selectionColor = UIColor.systemBlue
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
    }
    
    class Coordinator: NSObject, FSCalendarDelegate {
        
        var parent: FSCalendarView
        
        init(_ calender: FSCalendarView) {
            self.parent = calender
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            self.parent.selectedDate = date
        }
    }
}
