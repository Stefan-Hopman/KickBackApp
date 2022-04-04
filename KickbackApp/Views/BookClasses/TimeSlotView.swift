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
    
    var title: String
    var color: Color = .white
    
    init(item: TimeSlotItem) {
        title = item.title.value
    }
    var body: some View {
        ZStack {
//            Color.lightBlack
            Button(action: {
                print("Time slot Button Clicked")
//                onTap?()
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
        }
    }
}


struct TimeSlotCollectionView: View {
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
//    var slots: [TimeSlotsViewModel] = []
    @ObservedObject var viewModel: TimeSlotsViewModel

    
    var body: some View {
            LazyVGrid(columns: gridItemLayout, spacing: 15) {
                ForEach(viewModel.slots, id: \.self) { timeSlot in
                    TimeSlotView(item: timeSlot)
                }
        }
    }
}

struct TimeSlotView_Previews: PreviewProvider {
    static var previews: some View {
//        TimeSlotView(title: "11:00 - 12:00 pm", color: .yellow)
        TimeSlotCollectionView(viewModel: .init())
    }
}
