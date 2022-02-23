//
//  HomeView.swift
//  KickbackApp
//
//  Created by Joga Singh on 23/02/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
            VStack {
                Text ("Welcome\n This is Home View")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
            }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.white)
                .edgesIgnoringSafeArea(.all)
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
