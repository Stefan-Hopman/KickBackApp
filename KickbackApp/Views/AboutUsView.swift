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
            ScrollView(.vertical, showsIndicators: false) {
                VStack(){
                
                    Text("About Us")
                        .foregroundColor(Color.darkPink)
                        .font(Font.largeTitle.bold())
                     
                    HStack{
                        VStack{
                            Text("Laura")
                                .frame(width: 125, height: 25, alignment: .center)
                                .foregroundColor(Color.docileWhite)
                                .font(Font.title3.bold())
                            Image("LauraCopped2")
                                .resizable()
                                .frame(width: 125, height: 125, alignment: .center)
                                .clipShape(Circle())
                        }
                        Spacer()
                        VStack{
                            Text("Ali")
                                .frame(width: 125, height: 25, alignment: .center)
                                .foregroundColor(Color.docileWhite)
                                .font(Font.title3.bold())
                            Image("LauraFriendCopped")
                                .resizable()
                                .frame(width: 125, height: 125, alignment: .center)
                                .clipShape(Circle())
                        }
                        
                    }.padding(EdgeInsets(top: 10, leading: 50, bottom: 0, trailing: 50))
                    Text("   We are a studio workout facility with the goal of giving back to at-risk populations that have been historically targeting for human trafficking. Utilize a one-for-one model in which every purchased class helps fund another class outside of the United States. These classes are designed not only to give our customers a great workout but also educate them on common schemes and physical protection again human trafficking.")
                        .foregroundColor(Color.kWhite)
                        .font(Font.caption)
                        .padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 20))
                    Text("   Laura Hopman and Alison Granirer are junior and sophomore students, respectively, at the University of Miami Herbert Business School. Laura is pursuing a degree in Business Analytics, Legal Studies, and Management with an expected graduation of May 2023. Alison is pursuing a degree in Legal Studies and Accounting with an expected graduation of May 2024. As a woman-owned company we are passionate preventing human trafficking as it is an issue that is highly unaddressed in society and frequently occurs in our own communities.")
                        .foregroundColor(Color.kWhite)
                        .font(Font.caption)
                        .padding(EdgeInsets(top: 3, leading: 20, bottom: 0, trailing: 20))
                    Text("   A junior at the University of Miami Herbert Business School, Laura Hopman is majoring in Legal Studies, Business Analytics, and Management. Laura was originally born in the Netherlands but has resided in South Florida for over the past decade before attending UM. All throughout her life Laura has been passionate about physical fitness and wellness, playing multiple sports growing up including travel volleyball. This love for working out, combined with her determination to help others, led to the natural creation of Kickback with partner Alison Granirer. Being part of a demographic that is regularly targeted, human trafficking is an issue that Laura holds close to her heart as she strongly believes the topic needs to be more widely discussed and taken preventive actions against within society.")
                        .foregroundColor(Color.kWhite)
                        .font(Font.caption)
                        .padding(EdgeInsets(top: 3, leading: 20, bottom: 0, trailing: 20))
                    Text("Why Kick Back")
                        .foregroundColor(Color.darkPink)
                        .font(Font.title2.bold())
                        .padding(EdgeInsets(top: 8, leading: 20, bottom: 0, trailing: 20))
                    Text("   Kickback’s mission is to spread awareness of the schemes and dangers of human trafficking that remain imenseley present in our society today. Human trafficking affects millions victims worldwide at any given moment and does not take grace to a particular race, sex, or other demographic, each member of society can fall victim to human trafficking. Our goal is strap these people will the knowledge and tools necessary to combat potential human trafficking schemes with a fun and convienent work out. In addition, because of the global scale human trafficking is present at as an organization we aim to spread awareness across borders traveling to high-risk areas. By 2030, we strive to educate over 10,000 people in high-risk areas about the dangers of human trafficking and early warning signs to not only kickback against human tracking not only themselves but also for their community.")
                        .foregroundColor(Color.kWhite)
                        .font(Font.caption)
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                    Spacer()
                }
                .listStyle(GroupedListStyle())
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
            }
                .background(Color.lightBlack)
                .padding(0)
                .clipped()
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
