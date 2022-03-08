//
//  CourseDetailView.swift
//  KickbackApp
//
//  Created by AjDevTech on 08/03/22.
//

import SwiftUI

struct CourseDetailView: View {
    @ObservedObject var viewModel: CourseViewModel
    
    var body: some View {
        VStack {
            Text("This is course Detail view")
            Text(viewModel.course.title)
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(viewModel: .init())
    }
}
