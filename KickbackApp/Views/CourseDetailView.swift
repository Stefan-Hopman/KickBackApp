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
                // Header
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
                            .font(Font.largeTitle.bold())
                            .padding(.bottom, 0)
                        Text("\"" + viewModel.course.slogan + "\"")
                            .foregroundColor(Color.white)
                            .font(Font.headline.italic())
                    }
                    Spacer()
                    // Invsible view just meant to center texxt
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 40, height: 40, alignment: .center)
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                
                HStack{
                    
                }
                Image(viewModel.course.courseDescriptionImagePath)
                    .resizable()
                    .frame(width: 375, height: 227, alignment: .center)
                    .cornerRadius(10)
                    .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))

                Text("About: ")
                    .foregroundColor(Color.docileWhite)
                    .font(Font.headline.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
                Text(viewModel.course.courseDescription)
                    .foregroundColor(Color.white)
                    .font(Font.body)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
              
                Text("Trainer: " + viewModel.course.instructor.instructorName)
                    .font(Font.title2.bold())
                    .foregroundColor(Color.darkPink)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                Text("About: ")
                    .foregroundColor(Color.docileWhite)
                    .font(Font.headline.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                Text("Are you ready to kick back and defend yourself?! Prepare to train with best to get the greatest Results. Learn to hit like they do in MMA!")
                    .foregroundColor(Color.white)
                    .font(Font.body)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                Spacer()
            }
            
        }
    }
}


struct gymImageView:View{
    @ObservedObject var viewModel: CourseViewModel
    
    var body: some View{
        Image(viewModel.course.imagePath)
            .resizable()
            .frame(width: 140.0, height: 140.0)
            .cornerRadius(15)
            .clipped()
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(viewModel: .init(), backButtonTapped: nil)
    }
}
