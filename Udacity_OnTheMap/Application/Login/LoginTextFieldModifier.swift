//
//  LoginTextFieldModifier.swift
//  Udacity_OnTheMap
//
//  Created by Work on 13/5/24.
//

import SwiftUI

struct LoginTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.blue, lineWidth: 1)
            )
    }
}
