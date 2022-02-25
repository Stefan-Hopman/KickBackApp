//
//  CourseListViewModel.swift
//  KickbackApp
//
//  Created by Joga Singh on 25/02/22.
//

import Foundation

final class CourseListViewModel: ObservableObject {
    var courseList: CourseList = testCourseList
    
    init() { }
    
    init(_ courseList: CourseList) {
        self.courseList = courseList
    }
}
