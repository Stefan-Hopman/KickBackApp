//
//  BookClassesView.swift
//  KickbackApp
//
//  Created by Joga Singh on 02/03/22.
//

import SwiftUI

struct BookClassesView: View {
    

    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy, hh:mm:ss a"
        // formatter.dateStyle = .long
        return formatter
    }()
    
//    @State private var date = Date()
    @State var showStoreDropDown: Bool = false
    @State var showClassTypeDropDown: Bool = false {
        didSet {
            isEventSelected = false
        }
    }
    @State var selectedStudio: DropDownItem?
    @State var selectedClassType: DropDownItem? = .init(title: "Upper Body")
    @State var selectedTimeSlot: String?
    
    @ObservedObject private var event = CalendarEvent() {
        didSet {
            print("Date selected")
        }
    }
    
    @ObservedObject var viewModel: BookClassesViewModel
    @State var selectedDate: Date? = nil {
        didSet {
            print("selectedDate in book classes: ", selectedDate ?? "n/a")
            /// Get time slots of selected date.
            let selectedDate = calendar.selectedDate
            guard let date = selectedDate, let studio = selectedStudio?.title else { return }
            let events = bookingManager.fetchEventsFor(date, studioName: studio)
            print(events)
        }
    }
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    @StateObject var properties = CalendarProperties()
    @State var isEventSelected: Bool = false
   
    var calendar: FSCalendarView!
    
    init() {
        let classes = bookingManager.allClasses
        viewModel = .init()
        print(classes.count)
        setCalendar()
    }
 
    mutating func setCalendar() {
        calendar = FSCalendarView(selectedDate: $event.date, selectedStudio: $event.studioName, onDateSelect: { date in
            print("Date Selcted in closure: ", date)
//            isEventSelected = false
        })
    }
    
    var body: some View {
        ZStack {
            Color.lightBlack.ignoresSafeArea()
            VStack(alignment: .center, spacing: 10.0) {
                Text("Your Studios")
                    .font(.headline)
                    .foregroundColor(.white)
                DropDownButton(viewModel: .init(selectedStudio), onTap: {
                    showClassTypeDropDown = false
                    showStoreDropDown.toggle()
                }, width: 175)
                    .zIndex(1)  /// required to show overlay on the top of the other views.
                    .overlay(
                        VStack {
                            if showStoreDropDown {
                                Spacer(minLength: 40)
                                DropDownView(items: viewModel.studioList) { selectedItem in
//                                    properties = nil
                                    calendar.selectedDate = nil
//                                    calendar.properties.selectedDate = nil
                                    selectedStudio = selectedItem
                                    showStoreDropDown = false
                                    showClassTypeDropDown = false
                                    calendar.selectedStudio = selectedItem.title
                                }
                            }
                        }, alignment: .topLeading
                    )
                calendar
                    .frame(height: 300.0, alignment: .center)
                if (selectedStudio != nil && event.date != nil) {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Available Classes")
                                .foregroundColor(.white)
                            HStack {
                                Text("Class type:")
                                    .foregroundColor(.white)
                                DropDownButton(viewModel: .init(selectedClassType), onTap: {
                                    showClassTypeDropDown.toggle()
                                    showStoreDropDown = false
                                }, width: 125)
                                    .zIndex(1)  /// required to show overlay on the top of the other views.
                                    .overlay(
                                        VStack {
                                            if showClassTypeDropDown {
                                                Spacer(minLength: 40)
                                                DropDownView(items: viewModel.classTypeList) { selectedItem in
                                                    selectedClassType = selectedItem
                                                    showClassTypeDropDown = false
                                                    showStoreDropDown = false
                                                }
                                            }
                                        }, alignment: .topLeading
                                    )
                            }
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                            .zIndex(1)
//                            TimeSlotCollectionView(viewModel: .init(date: event.date!, studioName: selectedStudio?.title ?? ""))
                            TimeSlotCollectionView(viewModel: .init(date: event.date!, studioName: selectedStudio?.title ?? ""), onSelection: { selectedTime in
                                print("on Selection called")
                                selectedTimeSlot = selectedTime
                                isEventSelected = true
                            })
                        }
                        .padding(9)
                        .zIndex(1)
                        if isEventSelected {
                            VStack(alignment: .center) {
                                Button(action: {
                                    print("Button Tapped")
                                    let studioName = selectedStudio?.title ?? ""
                                    let classType = selectedClassType?.title ?? ""
                                    let date = event.date!
                                    let time = selectedTimeSlot
                                    
                                    let element = ClassBookingElement(classType: classType, classStartTime: time, studioName: studioName, date: date)
                                    bookingManager.add(element)
                                    calendar.reload()
                                    
                                    calendar.selectedDate = nil
                                    isEventSelected = false
                                }) {
                                    Text("BOOK")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .padding(.vertical)
                                        .padding(.horizontal, 50)
                                        .background(Color.black)
                                        .clipShape(Capsule())
                                        .shadow(color: Color.darkPink.opacity(0.25), radius: 5, x: 0, y: 0)
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }
}


struct BookClassesView_Previews: PreviewProvider {
    static var previews: some View {
        BookClassesView()
    }
}
