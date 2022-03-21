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
            VStack {
                HStack{
                    VStack(alignment: .leading) {
                        Text ("Protect Yourself & The World!")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.darkPink)
                            .multilineTextAlignment(.leading)
            
                    }   /// VStack closed
                    Spacer()
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundColor(Color.darkPink)
                    
                        .frame(width: 20, height: 20)
                        .padding(10)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.darkPink, lineWidth: 1))
                        .shadow(radius: 10)
                        .onTapGesture {
                            print("Profile image tapped")
                        }
                }
                    .navigationBarHidden(true)    /// HStack closed
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                
                ForEach(PriceOptions){ filter in
                    PriceOptionView(optionData: filter)
                }
                
            Spacer()
            }
            
            
        }
        
    }
}


struct PriceOptionView: View {

    @State var optionData: PriceOption
    
    var body: some View{
        HStack{
            Circle()
                .stroke(Color.gray,lineWidth: 2)
                .frame(width: 30, height: 30, alignment: .leading)
            
        }
        .frame(width: 350, height: 75)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .circular))
    }
   
}



struct PriceOption: Identifiable {
    
    var id = UUID().uuidString
    var option: String
    var amount: String
    var checked: Bool
}

var PriceOptions = [

    PriceOption(option: "One Course", amount: "$45.00", checked: false),
    PriceOption(option: "Monthly Membership", amount: "$200.00 Per Month", checked: false),
    PriceOption(option: "10 Class Package", amount: "$400.00", checked: false),
    PriceOption(option: "20 Class Package", amount: "$750.00", checked: false)
    


]

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView()
    }
}
