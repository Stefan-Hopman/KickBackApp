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

class CalendarProperties: ObservableObject {
    @Published var selectedDate: Date? {
        didSet {
            print("properties changed ABC")
        }
    }
}

struct FSCalendarView: UIViewRepresentable {
    @Binding var selectedDate: Date? {
        didSet {
            if selectedDate == nil {
                for date in calendar.selectedDates {
                    calendar.deselect(date)
                }
            }
        }
    }
    
    var test: String = "Test"
    @Binding var selectedStudio: String? {
        didSet {
            print("selectedStudio: ", selectedStudio ?? "")
            calendar.reloadData()
        }
    }
    
    let selectedDates = ["2022/03/27", "2017/01/06", "2017/01/17"]
    
    var eventColor: UIColor = .red
    let calendar = FSCalendar()
    
    @State var onDateSelect: ((Date) -> ())?
    
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
        calendar.dataSource = context.coordinator
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
//        if properties.selectedDate == nil {
//            print("Clean the data please")
//        }
    }
    
    
    
    func nextTapped() {
        let nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: calendar.currentPage)
        calendar.setCurrentPage(nextMonth!, animated: true)
        print(calendar.currentPage)
        calendar.reloadData()
    }

    func previousTapped() {
        let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: calendar.currentPage)
        calendar.setCurrentPage(previousMonth!, animated: true)
        print(calendar.currentPage)
    }
    
    
    mutating func studioSelected(_ studioName: String) {
        selectedStudio = studioName
        calendar.reloadData()
//        setCalendarPreferences()
    }
    
    func setCalendarPreferences() {
        guard let selectedStudio = selectedStudio else { return }
        let currentDate = calendar.currentPage
        let fetchedEvents = bookingManager.fetchEventsFor(currentDate, studioName: selectedStudio)
        print(fetchedEvents)
    }
    
    func reload() {
        calendar.reloadData()
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
        self.calendar.onDateSelect?(date)
    }
    
}

extension Coordinator: FSCalendarDelegateAppearance {
   
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        if let selectedStudio = self.calendar.selectedStudio  {
            let fetchedEvents = bookingManager.fetchEventsFor(date, studioName: selectedStudio)
            print(fetchedEvents.count, date.toString())
            if fetchedEvents.count >= TimeSlots.allCases.count {
                return .white.withAlphaComponent(0.5)
            }
        }
        
        let dateString = self.dateFormatter1.string(from: date)
        return self.calendar.selectedDates.contains(dateString) ? .green : .white
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleSelectionColorFor date: Date) -> UIColor? {
        let dateString = self.dateFormatter1.string(from: date)
        return self.calendar.selectedDates.contains(dateString) ? .green : .white
    }
}

extension Coordinator: FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        guard let selectedStudio = self.calendar.selectedStudio else { return 0 }
        let fetchedEvents = bookingManager.fetchEventsFor(date, studioName: selectedStudio)
        return fetchedEvents.count > 0 ? 1 : 0
    }
}
