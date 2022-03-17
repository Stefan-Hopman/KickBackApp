//
//  AboutUsView.swift
//  KickbackApp
//
//  Created by Joga Singh on 02/03/22.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        ZStack {
            Color.lightBlack.ignoresSafeArea()
            Text("About US")
                .foregroundColor(.white)
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
