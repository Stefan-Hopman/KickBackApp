//
//  CourseView.swift
//  KickbackApp
//
//  Created by Joga Singh on 25/02/22.
//

import SwiftUI

struct CourseView: View {
    
    @ObservedObject var viewModel: CourseViewModel
    var isFavoriteCourse:Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Image(viewModel.course.imagePath)
                .resizable()
                .frame(width: 140.0, height: 140.0)
                .cornerRadius(15)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(viewModel.course.title).font(Font.title3)
                    .foregroundColor(Color.white)
                Text(viewModel.course.instructorName).font(.headline).foregroundColor(Color.gray)
                if(isFavoriteCourse == false){
                    Text(viewModel.course.date).font(.subheadline).foregroundColor(Color.gray)
                    Text(viewModel.course.time).font(.caption).foregroundColor(Color.gray)
                }
                
                
            }
                
                
        }
        
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(viewModel: .init(), isFavoriteCourse: false)
    }
}
