//
//  CourseViewModel.swift
//  KickbackApp
//
//  Created by Joga Singh on 25/02/22.
//

import Foundation

final class CourseViewModel: ObservableObject {
    var course: Course = testCourse
    
    init() {
        
    }
    
    init(_ course: Course) {
        self.course = course
    }
}
