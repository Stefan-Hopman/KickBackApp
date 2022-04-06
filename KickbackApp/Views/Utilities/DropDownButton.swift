//
//  DropDownButton.swift
//  KickbackApp
//
//  Created by AjDevTech on 15/03/22.
//

import SwiftUI

struct DropDownButton: View {
    
//    var title: String?
//    @State var title: DropDownItem?
    
    @ObservedObject var viewModel: DropDownButtonViewModel
    var onTap: (() -> ())?
    var width: CGFloat
    var isShowDropDown: Bool = true
    var body: some View {
        ZStack {
//            Color.lightBlack
            Button(action: {
                print("Drop Down Button Clicked")
                onTap?()
            }) {
                HStack(alignment: .center) {
                    Text(viewModel.item?.title ?? "Please Select").foregroundColor(.white)
                    if isShowDropDown {
                        Spacer()
                        Image(systemName: "chevron.down").foregroundColor(.white)
                        .frame(width: 20)
                    }
                }
//                .colorInvert()
                .frame(width: width)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
                )
               
            }
        }
    }
}

//struct DropDownButton_Previews: PreviewProvider {
//    static var previews: some View {
//        //DropDownButton(viewModel: .init())
//    }
//}
