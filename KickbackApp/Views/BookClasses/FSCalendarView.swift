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
    
    var eventColor: UIColor = .red
    let calendar = FSCalendar()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    func makeUIView(context: Context) -> FSCalendar {
        calendar.delegate = context.coordinator
        calendar.appearance.todayColor = .systemGreen
        calendar.appearance.selectionColor = .systemBlue
        
        calendar.appearance.weekdayTextColor = .white
        calendar.appearance.headerTitleColor = .white
        
        calendar.appearance.titlePlaceholderColor = .lightGray
        calendar.appearance.titleDefaultColor = .white
        
        calendar.appearance.eventDefaultColor = eventColor
        calendar.dataSource = context.coordinator
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
    }
    
    
    
    func nextTapped() {
        let nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: calendar.currentPage)
        calendar.setCurrentPage(nextMonth!, animated: true)
        print(calendar.currentPage)
    }

    func previousTapped() {
        let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: calendar.currentPage)
        calendar.setCurrentPage(previousMonth!, animated: true)
        print(calendar.currentPage)
    }
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

extension Coordinator: FSCalendarDataSource {
    
}
