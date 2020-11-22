//
//  MHMapViewController.swift
//  ReEntry
//
//  Created by Allison Jung on 10/17/20.
//

import UIKit
import MapKit

class MHMapViewController: UIViewController, CLLocationManagerDelegate {

    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var userLocation = CLLocation()
    var closestLocation : CLLocation? = nil
    var minDistance : CLLocationDistance = 0.0
    var closestLocationAddress = ""
    var locationName = ""
    var selectedPlacemarkName = ""
    
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
        
        self.userLocation = locations[0]
        
        let coordinates = CLLocationCoordinate2D(latitude: self.userLocation.coordinate.latitude, longitude: self.userLocation.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075)
        //smaller latitutdeDelta means more zoomed in. Center map based on user's location
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        mapView.setRegion(region, animated: true)
        
        findNearestMHResource()
    }
    
    func findNearestMHResource() {
        let searchRequest = MKLocalSearch.Request()
        //Query for restaurants near user's location
        searchRequest.naturalLanguageQuery = "\(locationName)"
        
        //Set Region of search request to region of map
        searchRequest.region = mapView.region
        
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: {(response, error) in
            //guard lets you cast a value to response that could be nil, make sure a place exists
            if error != nil {
                            print("An error occurred")
                        } else if response!.mapItems.count == 0 {
                            print("No matches found")
                        } else {
                            print("Matches found")
                            print(self.userLocation)
                            for place in response!.mapItems {
                                print(place.placemark.subThoroughfare! + " " + place.placemark.thoroughfare! + " " + place.placemark.locality! + " " + place.placemark.administrativeArea!)
                                print(place.name)
                                print(place.placemark.coordinate.latitude)
                                print(place.placemark.coordinate.longitude)
                                let placemark = CLLocation(latitude: place.placemark.coordinate.latitude, longitude: place.placemark.coordinate.longitude)
                                if self.closestLocation == nil {
                                    self.closestLocation = placemark
                                    self.minDistance = self.userLocation.distance(from: placemark)
                                    self.selectedPlacemarkName = place.name!
                                    self.closestLocationAddress = place.placemark.subThoroughfare! + " " + place.placemark.thoroughfare! + " " + place.placemark.locality! + " " + place.placemark.administrativeArea!
                                }
                                else if self.minDistance > self.userLocation.distance(from: placemark) && place.name != nil {
                                    self.closestLocation = placemark
                                    self.minDistance = self.userLocation.distance(from: placemark)
                                    self.selectedPlacemarkName = place.name!
                                    self.closestLocationAddress = place.placemark.subThoroughfare! + " " + place.placemark.thoroughfare! + " " + place.placemark.locality! + " " + place.placemark.administrativeArea!
                                }
                                
                            }
                            self.addAnnotation()
                            self.updateView()
                        }
                    })
        }
                            

    func addAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = self.closestLocation!.coordinate
        annotation.title = "\(selectedPlacemarkName)"
        self.mapView.addAnnotation(annotation)
        
    }
    
    func updateView() {
            addressLabel.text = closestLocationAddress
        nameLabel.text = self.selectedPlacemarkName
        distanceLabel.text = "\(Int(minDistance * 0.000621371)) miles away"
        }
    
    
    @IBAction func MHOpenInMaps(_ sender: Any) {
        let coords = closestLocation!.coordinate
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coords))
        mapItem.name = "\(closestLocationAddress)"
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
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
