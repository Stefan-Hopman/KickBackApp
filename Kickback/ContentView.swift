//
//  ContentView.swift
//  Kickback
//
//  Created by Stefan Hopman on 12/26/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
        // for light status bar
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    var body: some View{
        GeometryReader{_ in
            VStack{
                Image("LauraLogoTemp")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
        }
        .background(Color(Color.darkPink as! CGColor).edgesIgnoringSafeArea(.all))
    }
}
