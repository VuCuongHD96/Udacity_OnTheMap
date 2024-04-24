//
//  AddLocationView.swift
//  Udacity_OnTheMap
//
//  Created by Work on 24/4/24.
//

import SwiftUI

private struct LocationTextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(height: 40)
            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
                
            }
    }
}

struct AddLocationView: View {
    var body: some View {
        UdacityNavigationView {
            HStack {
                Button(action: {
                    
                }, label: {
                    Image("undo")
                })
                Spacer()
                Text("Add Location")
                    .fontWeight(.bold)
                Spacer()
                Rectangle()
                    .fill(.white)
                    .frame(width: 30, height: 30)
                    
            }
            .padding(.horizontal)
        } bodyContent: {
            VStack(spacing: 30) {
                Image("icon_world")
                VStack(spacing: 15) {
                    TextField("Enter a Location", text: .constant(""))
                        .modifier(LocationTextFieldModifier())
                    TextField("Enter a Website", text: .constant(""))
                        .modifier(LocationTextFieldModifier())
                    findButton
                }
            }
            .padding()
            .padding(.top, 150)
        }
    }
    
    private var findButton: some View {
        Button {
            
        } label: {
            Text("FIND LOCATION")
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(Color.blue.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                }
        }
    }
}

#Preview {
    AddLocationView()
}
