//
//  DropDownView.swift
//  KickbackApp
//
//  Created by AjDevTech on 15/03/22.
//

import SwiftUI

typealias buttonTapClosure = ((DropDownItem) -> ())

struct DropDownView: View {
    
    var items: [DropDownItem] = []
    
    var action : buttonTapClosure? = nil    //
    
    init(items: [String] = ["Sudoku", "Elite"], action: buttonTapClosure? = nil) {
        self.action = action
        for item in items {
            self.items.append(.init(title: item))
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 4){
                ForEach(items) { item in
                    Button(action: {
                        print(item.title, "tapped")
                        action?(item)
                    }) {
                        VStack {
                            Text(item.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.lightBlack)
                                .padding([.leading, .top], 4)
                            
                        }
                    }
                    
                    Divider()
                }
            }
            //.clipped()
           // .frame(height: 200)
            .padding(.all, 12)
            .background(RoundedRectangle(cornerRadius: 6).foregroundColor(.white).shadow(radius: 2))
        }
        .frame(height: 200)
    }
}



struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownView()
    }
}
