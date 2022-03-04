//
//  ContentView.swift
//  KickbackApp
//
//  Created by Stefan Hopman on 01/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var index = 0
    @State private var willMoveToNextScreen: Bool = false
    
    var body: some View{
        NavigationView{
            GeometryReader{_ in
                
//                NavigationLink(destination: HomeView(viewModel: HomeViewModel()).navigationBarBackButtonHidden(true), isActive: $willMoveToNextScreen) { }
                
                NavigationLink(destination: TabbarView().navigationBarBackButtonHidden(true), isActive: $willMoveToNextScreen) { }
                
                Spacer()
                VStack{
                    
                    Image("kickBackLogo")
                        .resizable()
                        .frame(width: 80, height: 96)
                        .cornerRadius(10)
                    //.frame(maxWidth: .infinity, maxHeight: .infinity)
                    Spacer()
                    ZStack{
                        
                        SignUP(index: self.$index, onLoginButtonTap: {
                            willMoveToNextScreen = true
                        })
                        //changing view order
                            .zIndex(Double(self.index))
                        Login(index: self.$index, onLoginButtonTap: {
                            willMoveToNextScreen = true
                        })
//                        Login(index: self.$index)
                    }
                    /// Alternative login options
                    HStack(spacing: 15){
                        Rectangle()
                            .fill(Color.black)
                            .frame(height: 1)
                        Text("OR")
                            .foregroundColor(Color.black)
                        Rectangle()
                            .fill(Color.black)
                            .frame(height: 1)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 50)
                    
                    HStack(spacing: 25){
                        Button(action: {
                            /// When clicking on the button this code block will trigger
                        }) {
                            Image("FacebookIcon")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width:50, height: 50)
                                .clipShape(Circle())
                        }
                        Button(action: {
                            /// When clicking on the button this code block willtrigger
                        }) {
                            Image("AppleIcon")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width:50, height: 50)
                                .clipShape(Circle())
                        }
                        Button(action: {
                            /// When clicking on the button this code block willtrigger
                        }) {
                            Image("TwitterIcon")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width:50, height: 50)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(.vertical)
            }
            .background(Color(CGColor.white).edgesIgnoringSafeArea(.all))
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
        .accentColor(.black)
        
    }
}


// Curve
struct CShape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            // right side curve
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShape1 : Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            // left side curve
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}



struct Login : View{
    
    @State var email = ""
    @State var pass = ""
    @Binding var index : Int
    
    /// Call back property
    var onLoginButtonTap: () -> ()
    
    
    var body: some View{
        
        ZStack(alignment: .bottom){
            VStack{
                
                HStack{
                    
                    VStack(spacing: 10){
                        
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .black)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.black : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 30) //for the top curve
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.black)
                        
                        TextField("Email Address", text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.black)
                        
                        SecureField("Password", text: self.$pass)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                HStack{
                    Spacer(minLength: 0)
                    NavigationLink(destination: ForgotPasswordView()){
                        Text("Forgot Password?")
                            .foregroundColor(Color.white.opacity(0.6))
                        
                    }
                    
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            // bottom padding
            .padding(.bottom, 65)
            .background(Color(CGColor.darkPink))
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            //Button
            Button(action: {
                onLoginButtonTap()
            }) {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.black)
                    .clipShape(Capsule())
                //shadow of the button
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            // moving the view down
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}

// SignUp Page
struct SignUP : View{
    @State var email = ""
    @State var newPass = ""
    @State var rePass = ""
    @Binding var index : Int
    
    /// Call back property
    var onLoginButtonTap: () -> ()
    
    var body: some View{
        ZStack(alignment: .bottom){
            VStack{
                
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10){
                        
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .white : .black)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.black : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 40) //for the top curve
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.black)
                        
                        TextField("Email Address", text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.black)
                        
                        SecureField("New Password", text: self.$newPass)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                //replacing forgot passowrd with reenter password
                //so same height will be maintained
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.black)
                        
                        SecureField("Confirm Password", text: self.$rePass)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
            }
            .padding()
            // bottom padding
            .padding(.bottom, 65)
            .background(Color(CGColor.darkPink))
            .clipShape(CShape1())
            // clipping the content shape also for tap gesture
            .contentShape(CShape1())
            // shadow
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            //Button
            Button(action: {
                onLoginButtonTap()
            }) {
                Text("SIGN UP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.black)
                    .clipShape(Capsule())
                //shadow of the button
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            // moving the view down
            .offset(y: 25)
            //hiding button view when its in background
            .opacity(self.index == 1 ? 1 : 0)
        }
        
    }
}
