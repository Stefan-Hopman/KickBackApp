//
//  TabbarView.swift
//  KickbackApp
//
//  Created by Joga Singh on 02/03/22.
//

import SwiftUI

struct TabbarView: View {
    
    init() {
        
        UITabBar.appearance().unselectedItemTintColor = UIColor(cgColor: CGColor.placeHolderGray)
        UITabBar.appearance().barTintColor = UIColor(Color.lightBlack)
        UITabBar.appearance().tintColor = UIColor(Color.darkPink)
        UITabBar.appearance().selectedItem?.badgeColor = UIColor(Color.darkPink)
    
    }
    
    @State private var selectedItem = 0
    
    var body: some View {
   
        NavigationView {
            TabView(selection: $selectedItem){
                HomeView(viewModel: HomeViewModel.init(), closure: { tabIndex in
                    selectedItem = tabIndex
                }).tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
                .navigationBarHidden(true)
                .navigationBarTitle("")
                
                BookClassesView().tabItem {
                    Label("Book Classes", systemImage: "bag")
                }
                .navigationBarHidden(true)
                .navigationBarTitle("")
                .tag(1)
                
                AboutUsView().tabItem {
                    Label("About Us", systemImage: "person")
                }
                .navigationBarHidden(true)
                .navigationBarTitle("")
                .tag(2)
                
                PriceView().tabItem {
                    Label("Pricing", systemImage: "creditcard")
                }
                .tag(3)
                .navigationBarHidden(true)
                .navigationBarTitle("")
            }
            
        
            .accentColor(.darkPink)
            
           
            
        }
        
        .navigationBarHidden(true)
        .navigationBarTitle("")
        
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
