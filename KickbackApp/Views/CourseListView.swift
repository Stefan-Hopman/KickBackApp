//
//  CourseListView.swift
//  KickbackApp
//
//  Created by Joga Singh on 25/02/22.
//

import SwiftUI

struct CourseListView: View {
    @ObservedObject var viewModel: CourseListViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.courseList.title)
                    .font(.title2).bold()
                Spacer()
                Button("See more") {
                    
                }
            }.padding(10)
            List(viewModel.courseList.courses) {course in
//                Text(course.title)
                CourseView(viewModel: .init(course))
            }
            .padding(0.0)
            Spacer()
        }
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView(viewModel: .init())
    }
}
