//
//  MHMapViewController.swift
//  ReEntry
//
//  Created by Allison Jung on 10/17/20.
//

import UIKit
import MapKit

class MHMapViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locateUser()

        // Do any additional setup after loading the view.
    }
    
    func locateUser() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        //must add to plist
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations[0]
        
        let coordinates = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075)
        //smaller latitutdeDelta means more zoomed in. Center map based on user's location
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        mapView.setRegion(region, animated: true)
        
        locationManager.stopUpdatingLocation()
        findNearestMHResource(userLocation: userLocation, name: "Mental Health")
    }
    
    func findNearestMHResource(userLocation: CLLocation, name: String) {
        let searchRequest = MKLocalSearch.Request()
        //Query for restaurants near user's location
        searchRequest.naturalLanguageQuery = name
        
        //Set Region of search request to region of map
        searchRequest.region = self.mapView.region
        
        let search = MKLocalSearch(request: searchRequest)
        
        search.start{ (response, error) in
            //guard lets you cast a value to response that could be nil, make sure a place exists
            guard let response = response else {
                print("we had an error finding a nearby mental health resource.")
                return
            }
            
            print(response.mapItems.count)
            var finalPlace = response.mapItems[0]
            var distance = CLLocationDistance(exactly: 1000000.0)
            
            for place in response.mapItems {
                let placemarkLocation = CLLocation(latitude: place.placemark.coordinate.latitude, longitude: place.placemark.coordinate.longitude)
                
                //check if location's distance is less than current distance. If it is, change the finalPlace and distance - find optimal distance
                if userLocation.distance(from: placemarkLocation) < distance! {
                    finalPlace = place
                    distance = userLocation.distance(from: placemarkLocation)
                }
            
            }
            self.addAnnotation(mapItem: finalPlace)
            //We are unsure of how to update the distance and address labels with the correct information. self.distanceLabel.text = "\(distance ?? 0)"
        }

    }
    
    func addAnnotation(mapItem: MKMapItem) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapItem.placemark.coordinate
        annotation.title = mapItem.name
        self.mapView.addAnnotation(annotation)
        
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
