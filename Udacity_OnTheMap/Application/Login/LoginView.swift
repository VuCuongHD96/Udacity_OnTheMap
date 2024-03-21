//
//  LoginView.swift
//  Udacity_OnTheMap
//
//  Created by Work on 21/03/2024.
//

import SwiftUI

struct LoginView: View {
    
    init(viewModel: LoginViewModel) {
        
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
