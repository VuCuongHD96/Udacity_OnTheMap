//
//  AddLocationView.swift
//  Udacity_OnTheMap
//
//  Created by Work on 2/5/24.
//

import SwiftUI
import MapKit

struct AddLocationView: View {
    
    let locationFound: LocationViewItem
    
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
            MapViewRepresent(openLinkTrigger: .constant(""), locationViewItemList: [locationFound])
                .overlay(alignment: .bottom) {
                    addButton
                }
                .padding(.top)
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    private var addButton: some View {
        Button {
        } label: {
            Text("ADD LOCATION")
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                }
        }
        .padding()
    }
}

#Preview {
    let locationFound = LocationViewItem(name: "Ha Noi",
                                         coordinate: .init(latitude: 0, longitude: 0))
    return AddLocationView(locationFound: locationFound)
}
