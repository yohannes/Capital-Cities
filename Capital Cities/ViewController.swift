//
//  ViewController.swift
//  Capital Cities
//
//  Created by Yohannes Wijaya on 9/26/15.
//  Copyright © 2015 Yohannes Wijaya. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var mapViewOutlet: MKMapView!
    
    // MARK: - Methods Override

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapViewOutlet.delegate = self
        
        let london = Capital(title: "London", info: "Home to the 2012 Summer Olympics.", coordinate: CLLocationCoordinate2DMake(51.507222, -0.1275))
        let oslo = Capital(title: "Oslo", info: "Founded over a thousand years ago", coordinate: CLLocationCoordinate2DMake(59.95, 10.75))
        let paris = Capital(title: "Paris", info: "Often called the City of Light.", coordinate: CLLocationCoordinate2DMake(48.8567, 2.3508))
        let rome = Capital(title: "Rome", info: "Has a whole country inside it.", coordinate: CLLocationCoordinate2DMake(41.90, 12.50))
        let washingtondc = Capital(title: "Washington DC", info: "Named after George himself.", coordinate: CLLocationCoordinate2DMake(38.895111, -77.036667))
        
        self.mapViewOutlet.addAnnotations([london, oslo, paris, rome, washingtondc])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Delegate Methods
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        //1. Define a reusable identifier
        let reusableIdentifer = "Capital"
        
        //2. Check whether the annotation we're creating a view for is one of our Capital Objects
        if annotation.isKindOfClass(Capital.self) {
            //3. Dequeue an annotation view from the map view's pool of unused views.
            var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(reusableIdentifer)
            
            //4. If it isn't able to find reusable view, create a new one & set its canShowCallout property to be true, which triggers the popup w/ the city name
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reusableIdentifer)
                annotationView!.canShowCallout = true
                
                //5. Create a new button w/ 'i' symbol.
                let detailedInfoButton = UIButton(type: .DetailDisclosure)
                annotationView!.rightCalloutAccessoryView = detailedInfoButton
            }
            else {
                //6. If it can reuse a view, update that view to use a different annotation.
                annotationView!.annotation = annotation
            }
            return annotationView
        }
        //7. if the annotation isn't from a capital city, it must return nil so iOS uses a default view.
        return nil
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let capital = view.annotation as! Capital
        let placeName = capital.title!
        let placeInfo = capital.info
        
        let alertController = UIAlertController(title: placeName, message: placeInfo, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }


}

