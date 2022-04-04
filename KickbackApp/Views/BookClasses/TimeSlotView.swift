//
//  TimeSlotView.swift
//  KickbackApp
//
//  Created by Joga Singh on 01/04/22.
//

import SwiftUI

enum Availablity {
    case available
    case notAvailable
    case booked
    
    var color: Color {
        switch self {
        case .available:
            return .black
        case .notAvailable:
            return .gray
        case .booked:
            return .green
        }
    }
}

struct TimeSlotView: View {
    
    typealias Closure = ((String) -> Void)
    var title: String
    var color: Color = .white
    
//    init(item: TimeSlotItem, color: Color = .white, ontap: @escaping Closure) {
//        title = item.title.value
//        onTap = ontap
//        self.color = color
//    }
    
    init(item: TimeSlotItem, isActive: Bool, isSelected: Bool, ontap: @escaping Closure) {
        title = item.title.value
        onTap = ontap
        color = .white.opacity(0.5)
        if isActive {
            color = isSelected ? .green : .white
        }
//        self.color = isActive ? (isSelected ? .green : .white.opacity(0.5)) : .
    }
    
    var onTap: Closure?
    var body: some View {
        ZStack {
//            Color.lightBlack
            Button(action: {
                print("Time slot Button Clicked")
                onTap?(title)
            }) {
                HStack(alignment: .center) {
                    Text(title).foregroundColor(color)
                        .font(.caption)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(lineWidth: 2)
                        .foregroundColor(color)
                )
                }
            }
            .disabled(color == .white.opacity(0.5))
        }
    }
}


struct TimeSlotCollectionView: View {
    
    typealias Completion = ((String) -> ())
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
//    var slots: [TimeSlotsViewModel] = []
    @ObservedObject var viewModel: TimeSlotCollectionViewModel
    var onEventSelection: Completion?
    
    init(viewModel: TimeSlotCollectionViewModel, onSelection: Completion?) {
        self.viewModel = viewModel
        onEventSelection = onSelection
    }

    var body: some View {
            LazyVGrid(columns: gridItemLayout, spacing: 15) {
//                ForEach(viewModel.slots, id: \.self) { timeSlot in
//                    TimeSlotView(item: timeSlot)
//                }
                ForEach(TimeSlotItem.items, id: \.self) { timeSlot in
//                    TimeSlotView(item: timeSlot)
                    let color: Color = viewModel.slots.titles.contains(timeSlot.title.rawValue) ? .white.opacity(0.5) : .green
                    TimeSlotView(item: timeSlot, isActive: color == .green, isSelected: viewModel.selectedSlotTitle == timeSlot.title.value) { title in
                        onEventSelection?(timeSlot.title.value)
                        viewModel.selectedSlotTitle = title
                    }
                    
//                    TimeSlotView(item: timeSlot, color: color, ontap: { title in
//                        print("Slot tapped: ", title)
//                        viewModel.selectedSlotTitle = title
//                    })
                    
//                    TimeSlotView(item: timeSlot, ontap: { title in
//                        print("Slot tapped: ", title)
//                    }, color: viewModel.slots.contains(timeSlot) ? .green : .white)
//                    { title in
//                        print("Slot tapped: ", title)
//                    }
                    
//                    ForEach(viewModel.slots, id: \.self) { slot in
//                        if timeSlot.title == slot.title {
//                            TimeSlotView(item: timeSlot, color: color) { title in
//                                print("Slot tapped: ", title)
//                            }
//                        }
//                    }
//                    TimeSlotView(item: timeSlot) { title in
//                        print("Slot tapped: ", title)
//                    }
                }
        }
    }
}

struct TimeSlotView_Previews: PreviewProvider {
    static var previews: some View {
//        TimeSlotView(title: "11:00 - 12:00 pm", color: .yellow)
        TimeSlotCollectionView(viewModel: .init(date: Date(), studioName: ""), onSelection: nil)
    }
}
