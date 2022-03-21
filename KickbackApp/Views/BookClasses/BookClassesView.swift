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
    
    @State private var date = Date()
    @State var showStoreDropDown: Bool = false
    
    var body: some View {
        ZStack {
            Color.lightBlack.ignoresSafeArea()
            VStack(alignment: .center, spacing: 10.0) {
                Text("Your Studios")
                    .font(.headline)
                    .foregroundColor(.white)
                DropDownButton {
                    showStoreDropDown.toggle()
                }.overlay(
                    VStack {
                        if showStoreDropDown {
                            Spacer(minLength: 40)
                            DropDownView()
                        }
                    }, alignment: .topLeading
                    
                )
                
                Text("Select a date")
                    .font(.title)
                    .foregroundColor(.white)
                DatePicker("Enter your birthday", selection: $date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(maxHeight: 400)
                    .colorScheme(.dark)
                Text("Date is:\n \(date, formatter: dateFormatter)")
                    .foregroundColor(.white)
            }
        }
    }
}

struct BookClassesView_Previews: PreviewProvider {
    static var previews: some View {
        BookClassesView()
    }
}
