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
    let time:String
    let date:String
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

let course: Course = .init(imagePath: "course", title: "Test title", instructorName: "Joga", time: "2:00pm - 3:00pm", date: "Monday, Feb 18")
let testCourse: Course = .init(imagePath: "course", title: "Test title", instructorName: "Joga", time: "2:00pm - 3:00pm", date: "Monday, Feb 18")

let testCourseList: CourseList = .init(title: "Upcoming classes", courses: [course, course], rightButtonTitle: "See more")

var allCoursesList: [CourseList] = [
    .init(title: "Upcoming Classes", courses: [.init(imagePath: "HitClass", title: "Hit Class", instructorName: "Andrea Mete", time: "2:00 pm - 3:00 pm", date: "Monday, Feb 18"), .init(imagePath: "LowerBodyClass", title: "Lower Body", instructorName: "Anny Iris", time: "12:00 pm - 1:00 pm", date: "Tuesday, Feb 19"), .init(imagePath: "FullBodyClass", title: "Full Body", instructorName: "Carolina Darcey", time: "11:00 am - 12:00 pm", date: "Thursday, Feb 21")], rightButtonTitle: "See all"),
    .init(title: "Past Classes", courses: [.init(imagePath: "StrengthClass", title: "Strength Class", instructorName: "Marin Steven", time: "4:00pm - 5:00pm", date: "Saturday, Feb 16"), .init(imagePath: "UpperbodyClass", title: "Upper Body", instructorName: "Tobias Philip", time: "2:00 pm - 3:00 pm", date: "Friday, Feb 15"), .init(imagePath: "CardioClass", title: "Cardio Class", instructorName: "Fidelma Hannah", time: "1:00 pm - 2:00 pm", date: "Thursday, Feb 14")], rightButtonTitle: "See all"),
    .init(title: "Favorite Classes", courses: [.init(imagePath: "HitClass", title: "Hit Class", instructorName: "Andrea Mete", time: "", date: ""), .init(imagePath: "FullBodyClass", title: "Full Body Class", instructorName: "Carolina Darcey", time: "", date: "")], rightButtonTitle: "See all"),
]
