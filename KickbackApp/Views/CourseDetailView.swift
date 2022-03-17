//
//  CourseDetailView.swift
//  KickbackApp
//
//  Created by AjDevTech on 08/03/22.
//

import SwiftUI

typealias Closure = (() -> ())?

struct CourseDetailView: View {
    @ObservedObject var viewModel: CourseViewModel
    
    var backButtonTapped: Closure
    var body: some View {
        ZStack {
            Color.lightBlack.ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                        print("Back Button Tapped")
                        backButtonTapped?()
                    }) {
                        Image(systemName: "arrow.left")
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(Color.white)
//                        Text("Back").foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text(viewModel.course.title)
                            .foregroundColor(Color.darkPink)
                            .font(Font.title.bold())
                        
                    }
                    Spacer()
                    // Invsible view just meant to center texxt
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 40, height: 40, alignment: .center)
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                Spacer()
                Text("This is course Detail view")
                    .foregroundColor(Color.white)
                Text(viewModel.course.title).foregroundColor(Color.white)
                Spacer()
               

            }       
            
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(viewModel: .init(), backButtonTapped: nil)
    }
}
