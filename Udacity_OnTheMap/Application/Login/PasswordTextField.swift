//
//  PasswordTextField.swift
//  Udacity_OnTheMap
//
//  Created by Work on 21/03/2024.
//

import SwiftUI

struct PasswordTextField: View {
    
    @Binding var passwordValue: String
    
    var body: some View {
        MemeTextField(placeHolder: "Password", textValue: $passwordValue)
    }
}

#Preview {
    PasswordTextField(passwordValue: .constant("Password value"))
}
