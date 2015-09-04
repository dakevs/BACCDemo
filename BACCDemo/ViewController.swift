//
//  ViewController.swift
//  BACCDemo
//
//  Created by QA on 7/30/15.
//  Copyright (c) 2015 ShepherdsSoftware. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Parse


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate

{
    var currentLoc: PFGeoPoint! = PFGeoPoint()
    @IBOutlet var mapView: MKMapView!
    
    var locationManager = CLLocationManager()


    @IBAction func tapReverse(sender: AnyObject) {
        let alert = UIAlertController(title: "Reverse Route", message: "This button will allow the users to easily \"reverse\" their route.", preferredStyle: UIAlertControllerStyle.Alert)
        let alertAction = UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in }
        alert.addAction(alertAction)
        presentViewController(alert, animated: true) { () -> Void in }
    }
    
    @IBAction func tapDrivers(sender: AnyObject) {
    
        let alert = UIAlertController(title: "Tapped Drivers", message: "This will show/hide on the map matching carpool Drivers.", preferredStyle: UIAlertControllerStyle.Alert)
        let alertAction = UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in }
        alert.addAction(alertAction)
        presentViewController(alert, animated: true) { () -> Void in }
    }
    
    @IBAction func tapRiders(sender: AnyObject) {

        let alert = UIAlertController(title: "Tapped Riders", message: "This will show/hide on the map matching Carpool Riders.", preferredStyle: UIAlertControllerStyle.Alert)
        let alertAction = UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in }
        alert.addAction(alertAction)
        presentViewController(alert, animated: true) { () -> Void in }
    
    }
    
    
    @IBAction func tapRoute(sender: AnyObject) {
        
        
        //stop Location Manager updating the location
        locationManager.stopUpdatingLocation()
        //set the region an
        
        /*
        var location:CLLocationCoordinate2D = locationManager.location!.coordinate
        
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
        */
        // OLD STUFF FOR DEMO
        var focusRoute: CLLocationCoordinate2D
        focusRoute = CLLocationCoordinate2DMake(37.910709, -122.215534)
        var span:MKCoordinateSpan = MKCoordinateSpanMake(1.1, 1.1)
        var region:MKCoordinateRegion  = MKCoordinateRegionMake(focusRoute, span)
        mapView.setRegion(region, animated:true)
    
        
        //now draw the spots on the mapview using Parse object named "CarpoolSpots"
        var annotationQuery = PFQuery(className: "CarpoolSpots")
        
      //  currentLoc = PFGeoPoint(location: mapView.location)
        
        annotationQuery.findObjectsInBackgroundWithBlock {
            (carpoolSpots, error) -> Void in
            if error == nil {
                // The find succeeded.
                //println("Successful query for annotations")
         
                
                
                let myCarpoolSpots = carpoolSpots as! [PFObject]
                
                for carpoolSpot in myCarpoolSpots {
                    let point = carpoolSpot["spotLocation"] as! PFGeoPoint
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2DMake(point.latitude, point.longitude)
                    self.mapView.addAnnotation(annotation)
                }
                

            } else {
                // Log details of the failure
                println("Error: \(error)")
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //locationManager variable declared at top of class
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        /*
        var work = CLLocationCoordinate2DMake(37.790533, -122.404622)
        var span:MKCoordinateSpan = MKCoordinateSpanMake(0.05, 0.05)
        var region:MKCoordinateRegion  = MKCoordinateRegionMake(work, span)
        mapView.setRegion(region, animated:true)
        DEMO DATA
        */
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var location:CLLocationCoordinate2D = manager.location!.coordinate
        
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
        
        self.mapView.removeAnnotations(mapView.annotations)
        
        var pinLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.latitude, location.longitude)
    
        var objectAnnotation = MKPointAnnotation()
        
        objectAnnotation.coordinate = pinLocation
        
        objectAnnotation.title = "Your location"
        
        self.mapView.addAnnotation(objectAnnotation)
        
        
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}