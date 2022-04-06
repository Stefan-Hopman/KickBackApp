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
    
    init(viewModel: HomeViewModel, closure: ((Int) -> ())?) {
        self.viewModel = viewModel
        self.onTabIndexChange = closure
        // this can be done in `onAppear` modifier if you need to restore the appereance later on `onDisappear`
        //UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
       // UITableView.appearance().separatorStyle = .none
//        return self
        }
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State private var isShowCourseDetailView: Bool = false
    @State private var isShowAllCoursesView: Bool = false
    @State var course: Course!
    @State var selectedCoursesList: CourseList!
    
    var onTabIndexChange: ((Int) -> Void)?
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: CourseDetailView(viewModel: course == nil ? .init() : .init(course!), backButtonTapped: {
                    isShowCourseDetailView = false
                })
                                .navigationBarHidden(true)
                                .navigationBarTitle("")
                               , isActive: $isShowCourseDetailView) { }
                
                NavigationLink(destination: AllCoursesView(viewModel: selectedCoursesList == nil ? .init() : .init(selectedCoursesList!), backButtonTapped: {
                    isShowAllCoursesView = false
                })
                                .navigationBarHidden(true)
                                .navigationBarTitle("")
                               , isActive: $isShowAllCoursesView) { }
                
                Color.lightBlack.ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0.0) {
                    
                            VStack(alignment: .center) {
                                HStack{
                                    Text ("Welcome Back Jamie!")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                    Spacer()
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .foregroundColor(Color.darkPink)
                                        .frame(width: 15, height: 15)
                                        .padding(10)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.darkPink, lineWidth: 1))
                                        .shadow(radius: 10)
                                        .onTapGesture {
                                            print("Profile image tapped")
                                        }
                                    }
                                Spacer()
                                Spacer()
                                VStack(alignment: .center){
                                    Text("172")
                                        .font(.system(size: 100, weight: .black, design: .default))
                                        .foregroundColor(Color.darkPink)
                                    Spacer()
                                    Text("women you have helped protect!")
                                        .font(Font.title2.bold())
                                        .foregroundColor(Color.white)
                                    
                                    DropDownButton(viewModel: .init(.init(title: "Learn More")), onTap: {
                                        print("Learn more implemented")
                                        onTabIndexChange?(2)
                                    }, width: 100, isShowDropDown: false)
                                }
                        }
                        .navigationBarHidden(true)    /// HStack closed
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.top, 2)
                        
                        Spacer()
                            .frame(height: 10)
                        ForEach(viewModel.courseList) { course in
                            
                            CourseListView(viewModel: CourseListViewModel(course)) { List in
                                self.selectedCoursesList = List
                                isShowAllCoursesView = true
                            } onCellTap: { course in
                                self.course = course
                                isShowCourseDetailView = true
                            }
                        }
                        .padding(.bottom, 10)
                        
                        VStack(alignment: .center){
                            Button(action: {
                                print("Button Tapped")
                                onTabIndexChange?(1)
                            }) {
                                Text("BOOK NOW")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding(.vertical)
                                    .padding(.horizontal, 50)
                                    .background(Color.black)
                                    .clipShape(Capsule())
                                    .shadow(color: Color.darkPink.opacity(0.25), radius: 5, x: 0, y: 0)
                                
                            }
                        
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        
                    }
                    
                    .listStyle(GroupedListStyle())
                    
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                    
                }.background(Color.lightBlack)
                    .padding(0)
                    .clipped()
            }
        }
    }
    
    
    func showCoursesList() {
        
    }
       
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(), closure: nil)
    }
}
