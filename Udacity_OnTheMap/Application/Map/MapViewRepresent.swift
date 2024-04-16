//
//  MapViewRepresent.swift
//  Udacity_OnTheMap
//
//  Created by Work on 30/03/2024.
//

import SwiftUI
import MapKit

struct MapViewRepresent: UIViewRepresentable {

    @Binding var openLinkTrigger: String
    let locationViewItemList: [LocationViewItem]
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        locationViewItemList.forEach { item in
            let annotation = MKPointAnnotation()
            annotation.title = item.name
            annotation.coordinate = item.coordinate
            uiView.addAnnotation(annotation)
        }
    }
    
    func makeCoordinator() -> MapCoordinator {
        MapCoordinator {
            openLinkTrigger = $0
        }
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
}

#Preview {
    let input = MapViewModel.Input()
    let output = MapViewModel.Output()
    return MapViewRepresent(openLinkTrigger: .constant(""),
                            locationViewItemList: [])
}
