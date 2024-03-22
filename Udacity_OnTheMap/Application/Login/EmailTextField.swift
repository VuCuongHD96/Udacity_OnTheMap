//
//  EmailTextField.swift
//  Udacity_OnTheMap
//
//  Created by Work on 21/03/2024.
//

import SwiftUI

struct EmailTextField: View {

    @Binding var emailValue: String
    
    var body: some View {
        MemeTextField(placeHolder: "Email", textValue: $emailValue)
    }
}

#Preview {
    EmailTextField(emailValue: .constant("Email value"))
}
