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
    
    var test: String = "Test"
    let selectedDates = ["2022/03/27", "2017/01/06", "2017/01/17"]
    
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
        
        calendar.placeholderType = .none
        calendar.appearance.titlePlaceholderColor = .lightGray
        calendar.appearance.titleDefaultColor = .white
        
        calendar.appearance.eventDefaultColor = eventColor
//        calendar.dataSource = context.coordinator
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
    
    var calendar: FSCalendarView
    
    fileprivate lazy var dateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    init(_ calender: FSCalendarView) {
        self.calendar = calender
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.calendar.selectedDate = date
    }
    
}

extension Coordinator: FSCalendarDelegateAppearance {
   
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let dateString = self.dateFormatter1.string(from: date)
        return self.calendar.selectedDates.contains(dateString) ? .green : .white
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleSelectionColorFor date: Date) -> UIColor? {
        let dateString = self.dateFormatter1.string(from: date)
        return self.calendar.selectedDates.contains(dateString) ? .green : .white
    }
}
