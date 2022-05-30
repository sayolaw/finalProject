//
//  MapViewController.swift
//  finalProject
//
//  Created by Sayo Lawal on 2022-05-26.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var map: MKMapView!
    var site : Site?
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        map.isZoomEnabled = false
        map.showsUserLocation = true
        
        
        // we assign the delegate property of the location manager to be this class
        locationManager.delegate = self
        
        // we define the accuracy of the location
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // rquest for the permission to access the location
        locationManager.requestWhenInUseAuthorization()
        
        // start updating the location
        locationManager.startUpdatingLocation()
        
        // 1st step is to define latitude and longitude
        let latitude: CLLocationDegrees = site!.latitude
        let longitude: CLLocationDegrees = site!.longitude
        // Do any additional setup after loading the view.
        displayLocation(latitude: latitude, longitude: longitude, title: site!.title!, subtitle: "The site is here")
    }
    
    func displayLocation(latitude: CLLocationDegrees,
                         longitude: CLLocationDegrees,
                         title: String,
                         subtitle: String) {
        // 2nd step - define span
        let latDelta: CLLocationDegrees = 0.05
        let lngDelta: CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lngDelta)
        // 3rd step is to define the location
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        // 4th step is to define the region
        let region = MKCoordinateRegion(center: location, span: span)
        
        // 5th step is to set the region for the map
        map.setRegion(region, animated: true)
        
        // 6th step is to define annotation
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.subtitle = subtitle
        annotation.coordinate = location
        map.addAnnotation(annotation)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
