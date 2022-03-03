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

struct CourseList: Identifiable {
    var id = UUID()
    let title: String
    let courses: [Course]
    let rightButtonTitle: String
    
    var count: Int {
        return courses.count
    }
}

let course: Course = .init(imagePath: "course", title: "Test title", instructorName: "Joga")
let testCourse: Course = .init(imagePath: "course", title: "Test title", instructorName: "Joga")

let testCourseList: CourseList = .init(title: "Upcoming classes", courses: [course, course], rightButtonTitle: "See more")

var allCoursesList: [CourseList] = [
    .init(title: "Upcoming Classes", courses: [.init(imagePath: "course", title: "Kick Boxing", instructorName: "Jack denial"), .init(imagePath: "course", title: "Judo", instructorName: "Shing chang")], rightButtonTitle: "See more"),
    .init(title: "Past Classes", courses: [.init(imagePath: "course", title: "Taiwando", instructorName: "Alan walker"), .init(imagePath: "course", title: "Wrestling", instructorName: "the undertaker")], rightButtonTitle: "See all"),
    .init(title: "Favourite Classes", courses: [.init(imagePath: "course", title: "Taiwando", instructorName: "Alan walker"), .init(imagePath: "course", title: "Wrestling", instructorName: "the undertaker")], rightButtonTitle: "See all"),
        .init(title: "Past Classes", courses: [.init(imagePath: "course", title: "Taiwando", instructorName: "Alan walker"), .init(imagePath: "course", title: "Wrestling", instructorName: "the undertaker")], rightButtonTitle: "See all"),
        .init(title: "Past Classes", courses: [.init(imagePath: "course", title: "Taiwando", instructorName: "Alan walker"), .init(imagePath: "course", title: "Wrestling", instructorName: "the undertaker")], rightButtonTitle: "See all"),
        .init(title: "Past Classes", courses: [.init(imagePath: "course", title: "Taiwando", instructorName: "Alan walker"), .init(imagePath: "course", title: "Wrestling", instructorName: "the undertaker")], rightButtonTitle: "See all"),
        .init(title: "Past Classes", courses: [.init(imagePath: "course", title: "Taiwando", instructorName: "Alan walker"), .init(imagePath: "course", title: "Wrestling", instructorName: "the undertaker")], rightButtonTitle: "See all")
]
