//
//  ForgotPasswordView.swift
//  KickbackApp
//
//  Created by Stefan Hopman on 2/14/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    var body: some View {
        VStack{
            Image("ForgotPasswordIcon")
                .resizable()
                .frame(width: 80, height: 80)
            Text("Trouble With Loggin In?")
                
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(CGColor.white).edgesIgnoringSafeArea(.all))
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
