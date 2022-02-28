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
                Button(viewModel.courseList.rightButtonTitle) {
                    
                }
            }.padding(10)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(viewModel.courseList.courses, id: \.id) { course in
                        CourseView(viewModel: .init(course))
                    }
                }
            }
//            Spacer()
        }
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView(viewModel: .init())
    }
}
