//
//  DropDownView.swift
//  KickbackApp
//
//  Created by AjDevTech on 15/03/22.
//

import SwiftUI



struct DropDownView: View {
    
    var items: [DropDownItem] = [.init(title: "Sudoku"), .init(title: "Elite"), .init(title: "Goldust"), .init(title: "Ashoka"), .init(title: "Ultimate"), .init(title: "Kingburn"), .init(title: "Naville")]
    
    var action : ((DropDownItem) -> ())? = nil
    
    var body: some View {
         VStack(alignment: .leading, spacing: 4){
            ForEach(items) { item in
                Button(action: {
                    print(item.title, "tapped")
                }) {
                    VStack {
                        Text(item.title)
                            .foregroundColor(.lightBlack)
                            .padding([.leading, .top], 4)
                        
                    }
                }
                Divider()
            }
        }
        .padding(.all, 12)
        .background(RoundedRectangle(cornerRadius: 6).foregroundColor(.white).shadow(radius: 2))
    }
}



struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownView()
    }
}
