//
//  CourseView.swift
//  KickbackApp
//
//  Created by Joga Singh on 25/02/22.
//

import SwiftUI

struct CourseView: View {
    
    @ObservedObject var viewModel: CourseViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Image(viewModel.course.imagePath)
                .resizable()
                .frame(width: 200.0, height: 150.0)
                .cornerRadius(20)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(viewModel.course.title).font(.title3)
                Text(viewModel.course.instructorName).font(.headline).foregroundColor(Color.gray)
            }
                
                
        }
        
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(viewModel: .init())
    }
}
