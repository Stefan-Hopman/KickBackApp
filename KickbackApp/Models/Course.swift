//
//  Course.swift
//  KickbackApp
//
//  Created by Joga Singh on 25/02/22.
//

import Foundation

struct Course: Identifiable {
    var id = UUID()
    let imagePath: String
    let title: String
    let instructorName: String
    let isFav: Bool = false
}

struct CourseList {
    let title: String
    let courses: [Course]
    let rightButtonTitle: String
    
    var count: Int {
        return courses.count
    }
}

let course: Course = .init(imagePath: "course", title: "Test title", instructorName: "Joga")
let testCourse: Course = .init(imagePath: "course", title: "Test title", instructorName: "Joga")

let testCourseList: CourseList = .init(title: "Adjust course", courses: [course, course], rightButtonTitle: "See more")

var list: [CourseList] = [
    .init(title: "Adjust course", courses: [course, course], rightButtonTitle: "See more"),
    .init(title: "Adjust course2", courses: [course, course], rightButtonTitle: "See all")
]
