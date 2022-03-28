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
    let instructor:Instructor
    let isFav: Bool = false
    let time:String
    let date:String
    let slogan:String
    //let images:[String]
}

struct Instructor: Identifiable{
    var id = UUID()
    let instructorName:String
    let instructorDescription:String
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

let course: Course = .init(imagePath: "course", title: "Test title", instructor: .init(instructorName: "Joga", instructorDescription: "Amazing trainer"), time: "2:00pm - 3:00pm", date: "Monday, Feb 18", slogan: "")
let testCourse: Course = .init(imagePath: "course", title: "Test title", instructor: .init(instructorName: "Joga", instructorDescription: "Amazing trainer"), time: "2:00pm - 3:00pm", date: "Monday, Feb 18", slogan: "")

let testCourseList: CourseList = .init(title: "Upcoming classes", courses: [course, course], rightButtonTitle: "See more")

var allCoursesList: [CourseList] = [
    .init(title: "Upcoming Classes", courses: [.init(imagePath: "HitClass", title: "Hit Class", instructor: .init(instructorName: "Andrea Mete", instructorDescription: ""), time: "2:00 pm - 3:00 pm", date: "Monday, Feb 18", slogan: "HIIT back twice as hard"), .init(imagePath: "LowerBodyClass", title: "Lower Body", instructor: .init(instructorName: "Anny Iris", instructorDescription: ""), time: "12:00 pm - 1:00 pm", date: "Tuesday, Feb 19", slogan: "Kneed Power?"), .init(imagePath: "FullBodyClass", title: "Full Body", instructor: .init(instructorName: "Carolina Darcey", instructorDescription: ""), time: "11:00 am - 12:00 pm", date: "Thursday, Feb 21", slogan: "Smack that ...")], rightButtonTitle: "See all"),
    .init(title: "Past Classes", courses: [.init(imagePath: "StrengthClass", title: "Strength Class", instructor: .init(instructorName: "Marin Steven", instructorDescription: ""), time: "4:00pm - 5:00pm", date: "Saturday, Feb 16", slogan: "You won't weigh me down"), .init(imagePath: "UpperbodyClass", title: "Upper Body", instructor: .init( instructorName: "Tobias Philip", instructorDescription: ""), time: "2:00 pm - 3:00 pm", date: "Friday, Feb 15", slogan: "Strike a Pose or a Predator"), .init(imagePath: "CardioClass", title: "Cardio Class", instructor: .init(instructorName: "Fidelma Hannah", instructorDescription: ""), time: "1:00 pm - 2:00 pm", date: "Thursday, Feb 14", slogan: "Fight or …. just flight")], rightButtonTitle: "See all"),
    .init(title: "Favorite Classes", courses: [.init(imagePath: "HitClass", title: "Hit Class", instructor: .init(instructorName: "Andrea Mete", instructorDescription: ""), time: "", date: "", slogan: "HIIT back twice as hard"), .init(imagePath: "FullBodyClass", title: "Full Body Class", instructor: .init(instructorName: "Carolina Darcey", instructorDescription: ""), time: "", date: "", slogan: "Smack that…")], rightButtonTitle: "See all"),
]
