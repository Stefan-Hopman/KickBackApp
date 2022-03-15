//
//  BookClassesView.swift
//  KickbackApp
//
//  Created by Joga Singh on 02/03/22.
//

import SwiftUI

struct BookClassesView: View {
    
    @State var showStoreDropDown: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 10.0) {
            Text("Your Studios")
                .font(.headline)
                .foregroundColor(.lightBlack)
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
        }
    }
}

struct BookClassesView_Previews: PreviewProvider {
    static var previews: some View {
        BookClassesView()
    }
}
