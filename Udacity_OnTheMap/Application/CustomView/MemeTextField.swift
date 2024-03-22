//
//  MemeTextField.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import SwiftUI

struct MemeTextField: View {
    
    var placeHolder: String
    @Binding var textValue: String
    
    var body: some View {
        TextField(placeHolder, text: $textValue)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.blue, lineWidth: 1)
            )
    }
}

#Preview {
    MemeTextField(placeHolder: "Place Holder", textValue: .constant("value"))
}
