//
//  MapListView.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import SwiftUI

struct MapListView: View {
    
    let locationArray = [
        "America",
        "Japan",
        "Viet Nam"
    ]
    
    var body: some View {
        List(locationArray, id: \.self) { item in
            HStack {
                Image(systemName: "heart.fill")
                Text(item)
            }
            .listRowSeparator(.visible)
        }
        .listStyle(.inset)
    }
}

#Preview {
    MapListView()
}
