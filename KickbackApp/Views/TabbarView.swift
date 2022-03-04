//
//  TabbarView.swift
//  KickbackApp
//
//  Created by Joga Singh on 02/03/22.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        
        ZStack {
            TabView {
                HomeView(viewModel: .init()).tabItem {
                    Label("Home", systemImage: "house")
                }.navigationBarBackButtonHidden(true)
                BookClassesView().tabItem {
                    Label("Book Classes", systemImage: "bag")
                }.navigationBarBackButtonHidden(true)
                AboutUsView().tabItem {
                    Label("About Us", systemImage: "person")
                }.navigationBarBackButtonHidden(true)
                PriceView().tabItem {
                    Label("Pricing", systemImage: "creditcard")
                }.navigationBarBackButtonHidden(true)
                
            }
        }.background(Color.black)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
