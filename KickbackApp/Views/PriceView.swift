//
//  PriceView.swift
//  KickbackApp
//
//  Created by Joga Singh on 02/03/22.
//

import SwiftUI

struct PriceView: View {
    var body: some View {
        ZStack {
            Color.lightBlack.ignoresSafeArea()
            Text("Price View")
                .foregroundColor(.white)
        }
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView()
    }
}
