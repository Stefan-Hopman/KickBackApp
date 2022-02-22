//
//  ForgotPasswordView.swift
//  KickbackApp
//
//  Created by Stefan Hopman on 2/14/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var emailAddress: String = ""
    @State private var textFieldIsEditing = false /// Keeps track of whether the text field is being edited or not
    var body: some View {
        VStack{
            Spacer()
            Image("ForgotPasswordIcon")
                .resizable()
                .frame(width: 80, height: 80)
                .padding(.top, 0)
            Text("Trouble With Logging In?")
                .font(.title2)
                .foregroundColor(.black)
                .padding(.top, 30)
            Text("Please enter your email address, and we will send you a link to recover your password.")
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.black)
                .padding(.top, 4)
                .padding(.leading, 35)
                .padding(.trailing, 35)
            
            TextField("Email Address", text: $emailAddress, onEditingChanged: { edit in
                self.textFieldIsEditing = edit
            })
                .keyboardType(.URL)
                .autocapitalization(.none)
                .placeholder(when: emailAddress.isEmpty) {
                        Text("Email Address")
                        .foregroundColor(Color(CGColor.placeHolderGray))
                        .padding(.leading, 25)
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                .padding(.bottom, 0)
                .frame(width: .none, height: 70, alignment: .center)
                .textFieldStyle(MyTextFieldStyle(focused: $textFieldIsEditing)).font(.title3)
                .foregroundColor(Color.black)
            
            Button(action: {
                
            }) {
                Text("Confirm")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.black)
                    .clipShape(Capsule())
                    //shadow of the button
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .padding(.top, 2)
            .padding(.bottom, 40)
            Spacer()
            Spacer()
            Spacer()
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
