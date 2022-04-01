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
    var body: some View {
        ZStack {
            Color.lightBlack
            Button(action: {
                print("Time slot Button Clicked")
//                onTap?()
            }) {
                HStack(alignment: .center) {
                    Text(title).foregroundColor(color)
//                    Image(systemName: "chevron.down").foregroundColor(.white)
//                    .frame(width: 20)
                }
//                .colorInvert()
                .frame(minWidth: 100)
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

struct TimeSlotView_Previews: PreviewProvider {
    static var previews: some View {
        TimeSlotView(title: "11:00 - 12:00 pm", color: .yellow)
    }
}
