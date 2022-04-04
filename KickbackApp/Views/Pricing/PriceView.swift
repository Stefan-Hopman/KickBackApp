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
                Image("PricingPage")
                    .resizable()
                    .frame(width: 375, height: 227, alignment: .center)
                    .cornerRadius(10)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                Text("Pricing Options")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.darkPink)
                    .padding(.top, 10)
                ForEach(PriceOptions){ filter in
                    PriceOptionView(optionData: filter)
                }
                
            Spacer()
            }
            
            
        }
        
    }
}

 typealias tapClosure = ((PriceOption) -> ())

struct PriceOptionView: View {

    //@State var checked: Bool
    
    @ObservedObject var optionData: PriceOption
    var action : tapClosure? = nil
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text(optionData.option)
                    .foregroundColor(Color.docileWhite)
                    .font(Font.title2.bold())
                
                Text(optionData.amount)
                    .foregroundColor(Color.kWhite)
                    .font(Font.headline.bold())
                    .padding(.leading, 0)
                    
            }
            Spacer()
            ZStack{
                Circle()
                    .stroke(optionData.checked ? Color.kWhite : Color.gray, lineWidth: 1)
                    .frame(width: 25, height: 25)
                if optionData.checked{
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size:25))
                        .foregroundColor(Color.kWhite)
                }
            }
        }
        .padding(.horizontal)
        .contentShape(Rectangle())
        .onTapGesture {
            for option in PriceOptions {
                option.checked = false
                if(optionData.id == option.id){
                    option.checked.toggle()
                }
            }
            //optionData.checked.toggle()
            
        }
    }
   
}




class PriceOption: Identifiable, ObservableObject {
    
    var id = UUID().uuidString
    var option: String = ""
    var amount: String = ""
    var checked: Bool = false
    init(option: String, amount: String, checked: Bool) {
            self.option = option
            self.amount = amount
            self.checked = checked
        }
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
