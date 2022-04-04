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
    @State var showClassTypeDropDown: Bool = false
    @State var selectedStudio: DropDownItem?
    @State var selectedClassType: DropDownItem?
    
    @ObservedObject private var event = CalendarEvent()
    @ObservedObject var viewModel: BookClassesViewModel
    var selectedDate: Date? = nil {
        didSet {
            print("selectedDate in book classes")
//            calendar?.selectedDate = selectedDate
        }
    }
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    @StateObject var properties = CalendarProperties()
    
    var calendar: FSCalendarView!
    
    init() {
        let classes = bookingManager.allClasses
        viewModel = .init()
        print(classes.count)
//        calendar = FSCalendarView(selectedDate: selectedDate, onDateChange: { date in
//            self.selectedDate = date
//        })
//        calendar = FSCalendarView(closure: { date in
//           selectedDate = date
//        })

        setCalendar()
    }
 
    mutating func setCalendar() {
//        calendar = FSCalendarView(closure: { date in
//           selectedDate = date
//        })
        calendar = FSCalendarView(selectedDate: $event.date)
//        e
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
                })
                    .zIndex(1)  /// required to show overlay on the top of the other views.
                    .overlay(
                        VStack {
                            if showStoreDropDown {
                                Spacer(minLength: 40)
                                DropDownView(items: viewModel.studios) { selectedItem in
//                                    properties = nil
                                    calendar.selectedDate = nil
//                                    calendar.properties.selectedDate = nil
                                    selectedStudio = selectedItem
                                    showStoreDropDown = false
                                    showClassTypeDropDown = false
                                }
                            }
                        }, alignment: .topLeading
                    )
                
                Text("Select a date")
                    .font(.title)
                    .foregroundColor(.white)
                calendar
                    .frame(height: 300.0, alignment: .center)
//                calendar.onDateChange = {
//
//                }
//                FSCalendarView(selectedDate: $event.date, eventColor: .yellow)
//                    .frame(height: 300.0, alignment: .center)
                if (selectedStudio != nil && event.date != nil) {
//                    Text("Selected date: \(event.date!, formatter: Self.taskDateFormat)")
//                        .foregroundColor(.white)
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
                                })
                                    .zIndex(1)  /// required to show overlay on the top of the other views.
                                    .overlay(
                                        VStack {
                                            if showClassTypeDropDown {
                                                Spacer(minLength: 40)
                                                DropDownView(items: viewModel.classType) { selectedItem in
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
                            TimeSlotCollectionView(viewModel: .init())
                        }
                        .padding(9)
                        .zIndex(1)
                        VStack(alignment: .center) {
                            Button(action: {
                                print("Button Tapped")
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
                        }.disabled(true)
                        
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
