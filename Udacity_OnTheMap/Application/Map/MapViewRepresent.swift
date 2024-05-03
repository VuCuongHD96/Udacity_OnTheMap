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
        
        if let firstLocation = locationViewItemList.first {
            setRegion(uiView: uiView, locationViewItem: firstLocation)
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
    
    private func setRegion(uiView: MKMapView, locationViewItem: LocationViewItem) {
        let centerCoordinate = locationViewItem.coordinate
        let coordinateSpan = MKCoordinateSpan()
        let coordinateRegion = MKCoordinateRegion(center: centerCoordinate,
                                                  span: coordinateSpan)
        uiView.setRegion(coordinateRegion, animated: true)
    }
}

#Preview {
    let input = MapViewModel.Input()
    let output = MapViewModel.Output()
    let coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    let locationViewItem = LocationViewItem(name: "", coordinate: coordinate)
    return MapViewRepresent(openLinkTrigger: .constant(""),
                            locationViewItemList: [locationViewItem])
}
