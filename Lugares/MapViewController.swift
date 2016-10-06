//
//  MapViewController.swift
//  Lugares
//
//  Created by Gerard Divi on 4/10/16.
//  Copyright © 2016 Gerard Divi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet var mapview: MKMapView!
    var place: Place!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapview.delegate = self
        
        self.mapview.showsTraffic = true
        self.mapview.showsScale = true
        self.mapview.showsCompass = true

        print("El mapa debe mostrar "+place.name)
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(place.location) { [unowned self] (placemarks, error) in
            if error == nil {
                
                //Procesar los posibles lugares
                for placemark in placemarks! {
                    
                    let annotation = MKPointAnnotation()
                    annotation.title = self.place.name
                    annotation.subtitle = self.place.type
                    
                    annotation.coordinate = (placemark.location?.coordinate)!
                    
                    self.mapview.showAnnotations([annotation], animated: true)
                    self.mapview.selectAnnotation(annotation, animated: true)
                }
            } else {
                print("Ha habido un error : \(error)")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "MyPin"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        var annotationView: MKPinAnnotationView? = self.mapview.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 52, height: 52))
        imageView.image = UIImage(data: self.place.image! as Data)
        annotationView?.leftCalloutAccessoryView = imageView
        
        annotationView?.pinTintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        return annotationView
        
    }
    
}
