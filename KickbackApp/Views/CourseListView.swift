//
//  CourseListView.swift
//  KickbackApp
//
//  Created by Joga Singh on 25/02/22.
//

import SwiftUI

struct CourseListView: View {
    @ObservedObject var viewModel: CourseListViewModel
    
    /// Call back property
    var onButtonTap: ((CourseList) -> ())?
    var onCellTap: ((Course) -> ())?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.courseList.title)
                    .font(.title2).bold()
                    .foregroundColor(Color.darkPink)
                    .foregroundColor(Color.white)
                Spacer()
                Button(viewModel.courseList.rightButtonTitle) {
                    onButtonTap?(viewModel.courseList)
                }
                .foregroundColor(Color.white)
                .font(Font.caption.bold())
            
            }.padding(10)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(viewModel.courseList.courses, id: \.id) { course in
                        CourseView(viewModel: .init(course), isFavoriteCourse: viewModel.courseList.title == "Favorite Classes" ? true : false)
                            .onTapGesture {
                                print("Cell tapped", course.title)
                                onCellTap?(course)
                            }
                    }
                }
            }
//            Spacer()
        }
        .background(Color.lightBlack)
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView(viewModel: .init())
    }
}
