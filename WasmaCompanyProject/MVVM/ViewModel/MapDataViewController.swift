//
//  MapDataViewController.swift
//  WasmaCompanyProject
//
//  Created by mac on 2/22/20.
//  Copyright © 2020 iti. All rights reserved.
//

import UIKit
import MapKit
class MapDataViewController: UIViewController {
    @IBOutlet var mapView: MKMapView?
    var selectedCity1 : Place!
    let locationManager = CLLocationManager()
    
    let places = Place.getPlaces()
    
    override func viewDidLoad() {
        //        requestLocationAccess()
        addAnnotations()
        
        mapView?.showsUserLocation = true
         requestLocationAccess() 
    }
    
    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return
            
        case .denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func addAnnotations() {
        mapView?.delegate = self
        mapView?.addAnnotations(places)
        
        let overlays = places.map { MKCircle(center: $0.coordinate, radius: 100) }
        mapView?.addOverlays(overlays)
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKCircleRenderer(overlay: overlay)
        renderer.fillColor = UIColor.black.withAlphaComponent(0.5)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 2
        return renderer
    }
    
  func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    
        let DetailVc = self.storyboard?.instantiateViewController(withIdentifier: "DisplayMapDataVC") as! DisplayMapDataVC
    DetailVc.cityname = Helper.getApiToken(key: "title1")!
//        self.navigationController?.pushViewController(DetailVc, animated: true)
    
    }

    
}

extension MapDataViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil
//        }
//
//        else {
//            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKAnnotationView()
//            annotationView.image = UIImage(named: "place icon")
//            annotationView.annotation =
            //            return annotationView}
            
            guard let annotation = annotation as? Place else { return nil }

            let identifier = "marker"
            var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier:identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//            view.backgroundColor = UIColor.orange
         
        }
        return view
    }
    }
    
