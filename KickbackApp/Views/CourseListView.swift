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
                Spacer()
                Button("See more") {
                    
                }
            }
            List(viewModel.courseList.courses) {course in
                Text(course.title)
            }
        }
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView(viewModel: .init())
    }
}
