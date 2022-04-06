//
//  AppState.swift
//  KickbackApp
//
//  Created by AJDEVTECH on 06/04/22.
//  https://stackoverflow.com/a/63735620/6175417

import Foundation

class AppState: ObservableObject {
    static let shared = AppState()
    
    @Published var selectedTab: Int = 0
}


/*
 /// This is how you can create Binding object of this class.
 /// Value of the property will be chnaged from another activity using environment variables:   
//        let index = Binding<Int>(
//            get: { self.appState.selectedTab },
//            set: {
//                appState.selectedTab = $0
//            })
 */
