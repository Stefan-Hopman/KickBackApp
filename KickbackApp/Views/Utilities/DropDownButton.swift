//
//  DropDownButton.swift
//  KickbackApp
//
//  Created by AjDevTech on 15/03/22.
//

import SwiftUI

struct DropDownButton: View {
    
    var onTap: (() -> ())?
    
    var body: some View {
        Button(action: {
            print("Drop Down Button Clicked")
            onTap?()
        }) {
            HStack(alignment: .center) {
                Text("Please Select").foregroundColor(.white)
                Image(systemName: "chevron.down").foregroundColor(.white)
                //.frame(width: 10)
            }
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.white)
            )
        }
    }
}

struct DropDownButton_Previews: PreviewProvider {
    static var previews: some View {
        DropDownButton()
    }
}
