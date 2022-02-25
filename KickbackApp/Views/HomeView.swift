//
//  HomeView.swift
//  KickbackApp
//
//  Created by Joga Singh on 23/02/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text ("Hi, lemon")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.203, green: 0.249, blue: 0.534))
                        .multilineTextAlignment(.leading)
                    Text("Are you ready to rock'in the class?")
                        .font(.subheadline)
                }   /// VStack closed
                Spacer()
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(10)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 1))
                    .shadow(radius: 10)
                    .onTapGesture {
                        print("Profile image tapped")
                    }
            }.navigationBarHidden(true)    /// HStack closed
            
            Spacer()
                .frame(height: 10)
            CourseListView(viewModel: .init(testCourseList))
//            List {
//                CourseListView(viewModel: .init(testCourseList))
//                CourseListView(viewModel: .init(testCourseList))
//            }
            Spacer()
        }.padding(10.0)  /// VStack closed
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
