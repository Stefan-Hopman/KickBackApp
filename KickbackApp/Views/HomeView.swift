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
        
//            List(viewModel.courseList) { course in
//                CourseListView(viewModel: CourseListViewModel(course)).listRowInsets(EdgeInsets())
//                    .listRowBackground(Color.clear)
//            }
//            .listStyle(GroupedListStyle())
            
            
        ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text ("Hi, Jamie")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.leading)
                            Text("Welcome back!")
                                .font(.subheadline)
                                .foregroundColor(Color.kGray)
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
                    }
                    .navigationBarHidden(true)    /// HStack closed
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    
                    Spacer()
                        .frame(height: 10)
                ForEach(viewModel.courseList) { course in
                    CourseListView(viewModel: CourseListViewModel(course))
                        .background(Color.white)
                        .listRowInsets(EdgeInsets())
                }
                .padding(.bottom, 10)
                VStack(alignment: .center){
                    Button(action: {
                        print("Button Tapped")
                    }) {
                        Text("BOOK NOW")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal, 50)
                            .background(Color.black)
                            .clipShape(Capsule())
                            .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                        }
                    
                    }
                
            }
                
            .listStyle(GroupedListStyle())
            
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
//            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                .listStyle(PlainListStyle()
            
//            CourseListView(viewModel: .init(testCourseList))
//            CourseListView(viewModel: .init(testCourseList))
//            List {
//                CourseListView(viewModel: .init(testCourseList))
//                CourseListView(viewModel: .init(testCourseList))
//            }

                
        }
        
            
            
    }
       
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
