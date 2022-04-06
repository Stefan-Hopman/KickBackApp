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
    let courseDescriptionImagePath: String
    let courseDescription: String
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

let course: Course = .init(imagePath: "course", courseDescriptionImagePath: "", courseDescription: "", title: "Test title", instructor: .init(instructorName: "Joga", instructorDescription: "Amazing trainer"), time: "2:00pm - 3:00pm", date: "Monday, Feb 18", slogan: "")
let testCourse: Course = .init(imagePath: "course", courseDescriptionImagePath: "", courseDescription: "", title: "Test title", instructor: .init(instructorName: "Joga", instructorDescription: "Amazing trainer"), time: "2:00pm - 3:00pm", date: "Monday, Feb 18", slogan: "")

let testCourseList: CourseList = .init(title: "Upcoming classes", courses: [course, course], rightButtonTitle: "See more")

var allCoursesList: [CourseList] = [
    .init(title: "Upcoming Classes", courses: [.init(imagePath: "HitClass", courseDescriptionImagePath: "HitCD", courseDescription: "High intensity interval training designed to have participants patake in short but strenuous bursts of training. HIIT allows for participants to be able to quickly get into exercises and spring into action at any given moment.", title: "Hit Class", instructor: .init(instructorName: "Maggie Marshall", instructorDescription: "Maggie is a high energy, enthusiastic trainer with over ten years of experience in the fitness industry. In addition, Maggie has found a passion for helping others protect themselves and has combined that for her love of fitness to become one of our shining stars at Kickback!"), time: "2:00 pm - 3:00 pm", date: "Monday, Feb 18", slogan: "HIIT back twice as hard"), .init(imagePath: "LowerBodyClass", courseDescriptionImagePath: "LowBodyCD", courseDescription: "Come prepared to fire up the glutes and quads in this lower body intensive workout. You will learn an array of different exercises that will keep your body protected and your legs toned.", title: "Lower Body",instructor: .init(instructorName: "Sarah Williams", instructorDescription: "If you are looking for a fun-filled class that gets your body burning, Sarah is the trainer for you. Known for her killer workout playlists, Sarah manages to make learning to defend yourself one of the highlights of your week. "), time: "12:00 pm - 1:00 pm", date: "Tuesday, Feb 19", slogan: "Kneed Power?"), .init(imagePath: "FullBodyClass", courseDescriptionImagePath: "FullBodyCD",courseDescription: "You will feel completely empowered after this workout by incorporating full body exercises to get your body up and moving. This workout includes upper body, lower body, and core exercises to walk out feeling strengthened and toned.", title: "Full Body", instructor: .init(instructorName: "Maggie Marshall", instructorDescription: "Maggie is a high energy, enthusiastic trainer with over ten years of experience in the fitness industry. In addition, Maggie has found a passion for helping others protect themselves and has combined that for her love of fitness to become one of our shining stars at Kickback!"), time: "11:00 am - 12:00 pm", date: "Thursday, Feb 21", slogan: "Smack that ...")], rightButtonTitle: "See all"),
    .init(title: "Past Classes", courses: [.init(imagePath: "StrengthClass", courseDescriptionImagePath: "StrengthCD", courseDescription: "This class incorporates strength focused exercises to build up the muscle in your body while stimulating your mind about the potential schemes of sex trafficking. Leave this class feeling not only physically but mentally prepared to fight an attack.", title: "Strength Class", instructor: .init(instructorName: "Jack Taylor", instructorDescription: "With a background in martial arts, Jack is one of our leading trainers helping us design the workouts that will make you feel safe and sweaty. Walk out of Jack’s classes feeling ready to kickback at the world with your toned body and educated mind."), time: "4:00pm - 5:00pm", date: "Saturday, Feb 16", slogan: "You won't weigh me down"), .init(imagePath: "UpperbodyClass", courseDescriptionImagePath: "UpperBodyCD", courseDescription: "Get ready to tone your arms in this strength-building workout. During this workout you will learn how to use your upper limbs to defend against potential all while feeling a great burn in those arms.",title: "Upper Body", instructor: .init( instructorName: "Sarah Williams", instructorDescription: " If you are looking for a fun-filled class that gets your body burning, Sarah is the trainer for you. Known for her killer workout playlists, Sarah manages to make learning to defend yourself one of the highlights of your week."), time: "2:00 pm - 3:00 pm", date: "Friday, Feb 15", slogan: "Strike a Pose or a Predator"), .init(imagePath: "CardioClass", courseDescriptionImagePath: "CardioCD", courseDescription: "This cardio workout will get your body sweating making you energized and simultaneously prepared to take flight in case of an emergency. ", title: "Cardio Class", instructor: .init(instructorName: "Sarah Williams", instructorDescription: "If you are looking for a fun-filled class that gets your body burning, Sarah is the trainer for you. Known for her killer workout playlists, Sarah manages to make learning to defend yourself one of the highlights of your week."), time: "1:00 pm - 2:00 pm", date: "Thursday, Feb 14", slogan: "Fight or …. just flight")], rightButtonTitle: "See all"),
    .init(title: "Favorite Classes", courses: [.init(imagePath: "HitClass", courseDescriptionImagePath: "HitCD", courseDescription: "High intensity interval training designed to have participants patake in short but strenuous bursts of training. HIIT allows for participants to be able to quickly get into exercises and spring into action at any given moment.", title: "Hit Class", instructor: .init(instructorName: "Maggie Marshall", instructorDescription: "Maggie is a high energy, enthusiastic trainer with over ten years of experience in the fitness industry. In addition, Maggie has found a passion for helping others protect themselves and has combined that for her love of fitness to become one of our shining stars at Kickback!"), time: "", date: "", slogan: "HIIT back twice as hard"), .init(imagePath: "FullBodyClass", courseDescriptionImagePath: "FullBodyCD", courseDescription: "You will feel completely empowered after this workout by incorporating full body exercises to get your body up and moving. This workout includes upper body, lower body, and core exercises to walk out feeling strengthened and toned",title: "Full Body Class", instructor: .init(instructorName: "Maggie Marshall", instructorDescription: "Maggie is a high energy, enthusiastic trainer with over ten years of experience in the fitness industry. In addition, Maggie has found a passion for helping others protect themselves and has combined that for her love of fitness to become one of our shining stars at Kickback!"), time: "", date: "", slogan: "Smack that…")], rightButtonTitle: "See all"),
]
