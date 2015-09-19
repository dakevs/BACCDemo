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

    @IBAction func btnLogout(sender: UIBarButtonItem) {
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
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //locationManager variable declared at top of class
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        print(PFUser.currentUser()?.username)
        
        /*
        var work = CLLocationCoordinate2DMake(37.790533, -122.404622)
        var span:MKCoordinateSpan = MKCoordinateSpanMake(0.05, 0.05)
        var region:MKCoordinateRegion  = MKCoordinateRegionMake(work, span)
        mapView.setRegion(region, animated:true)
        DEMO DATA
        */
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocationCoordinate2D = manager.location!.coordinate
        
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
        
        self.mapView.removeAnnotations(mapView.annotations)
        
        let pinLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.latitude, location.longitude)
    
        let objectAnnotation = MKPointAnnotation()
        
        objectAnnotation.coordinate = pinLocation
        
        objectAnnotation.title = "Your location"
        
        self.mapView.addAnnotation(objectAnnotation)
        
        
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "logout" {
            PFUser.logOut()
            var currentUser = PFUser.currentUser()
            
            print(PFUser.currentUser()?.username)
            
        }
    }


}