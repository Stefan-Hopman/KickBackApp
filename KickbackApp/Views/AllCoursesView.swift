//
//  AllCoursesView.swift
//  KickbackApp
//
//  Created by AjDevTech on 08/03/22.
//

import SwiftUI

struct AllCoursesView: View {
    
    @ObservedObject var viewModel: CourseListViewModel
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
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                Spacer()
                Text("This is course List view")
                    .foregroundColor(Color.white)
                Text(viewModel.courseList.title).foregroundColor(Color.white)
                Spacer()
            }
            
        }
    }
}

struct AllCoursesView_Previews: PreviewProvider {
    static var previews: some View {
//        AllCoursesView()
        AllCoursesView(viewModel: .init(), backButtonTapped: nil)
    }
}
