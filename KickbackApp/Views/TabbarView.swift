//
//  TabbarView.swift
//  KickbackApp
//
//  Created by Joga Singh on 02/03/22.
//

import SwiftUI

struct TabbarView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
        UITabBar.appearance().barTintColor = UIColor(Color.lightBlack)
    }
    
    var body: some View {
        NavigationView {
            TabView {
                HomeView(viewModel: .init()).tabItem {
                    Label("Home", systemImage: "house")
                }
                .navigationBarHidden(true)
                .navigationBarTitle("")
                
                BookClassesView().tabItem {
                    Label("Book Classes", systemImage: "bag")
                }
                .navigationBarHidden(true)
                .navigationBarTitle("")
                
                AboutUsView().tabItem {
                    Label("About Us", systemImage: "person")
                }
                .navigationBarHidden(true)
                .navigationBarTitle("")
                
                PriceView().tabItem {
                    Label("Pricing", systemImage: "creditcard")
                }
                .navigationBarHidden(true)
                .navigationBarTitle("")
            }
            .accentColor(.white)
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
