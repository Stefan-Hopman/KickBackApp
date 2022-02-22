//
//  CustomTextFields.swift
//  KickbackApp
//
//  Created by Stefan Hopman on 2/18/22.
//

import SwiftUI

// MARK: Stuctures
// Created by Stefan Hopman. This allows you to change the background of your text field when tapped. This was previously
// not possible in Swift UI's version of the text field. 
struct MyTextFieldStyle: TextFieldStyle {
    @Binding var focused: Bool
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(focused ? Color(CGColor.darkPink) : Color(CGColor.gray), lineWidth: 1)
        ).padding()
    }
}


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
