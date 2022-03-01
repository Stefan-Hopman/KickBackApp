//
//  HomeView.swift
//  KickbackApp
//
//  Created by Joga Singh on 23/02/22.
//

import SwiftUI

struct NoButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}

struct HomeView: View {
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        // this can be done in `onAppear` modifier if you need to restore the appereance later on `onDisappear`
            UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
        UITableView.appearance().separatorStyle = .none
//        return self
        }
    
    @ObservedObject var viewModel: HomeViewModel
    
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
//            List(viewModel.courseList) { course in
//                CourseListView(viewModel: CourseListViewModel(course)).listRowInsets(EdgeInsets())
//                    .listRowBackground(Color.clear)
//            }
//            .listStyle(GroupedListStyle())
            
            
            List {
                ForEach(viewModel.courseList) { course in
                    CourseListView(viewModel: CourseListViewModel(course))
                        .background(Color.white)
                        .listRowInsets(EdgeInsets())
                }
//                .background(Color.white)
            }
            .listStyle(GroupedListStyle())
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                .listStyle(PlainListStyle())
                
            
            Button(action: {
                    print("sign up bin tapped")
                }) {
                    Text("Book Class")
                        .frame(minWidth: 0)
                        .font(.system(size: 18))
                        .padding(EdgeInsets(top: 15, leading: 40, bottom: 15, trailing: 40))
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 2)
                    )
                }
                .background(Color(red: 0.203, green: 0.249, blue: 0.534)) // If you have this
                .cornerRadius(25)
            
//            CourseListView(viewModel: .init(testCourseList))
//            CourseListView(viewModel: .init(testCourseList))
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
        HomeView(viewModel: HomeViewModel())
    }
}
