//
//  MapCoordinator.swift
//  Udacity_OnTheMap
//
//  Created by Work on 13/4/24.
//

import SwiftUI
import MapKit

class MapCoordinator: NSObject, MKMapViewDelegate {

    // MARK: - Define
    typealias OpenLinkHandler = (String) -> Void
    
    // MARK: - Property
    var openLinkTrigger: OpenLinkHandler?
    
    init(openLinkTrigger: @escaping OpenLinkHandler) {
        self.openLinkTrigger = openLinkTrigger
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        else {
            pinView!.annotation = annotation
        }
        return pinView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            if let subtitle = view.annotation?.subtitle {
                openLinkTrigger?(subtitle ?? "")
            }
        }
    }
}
