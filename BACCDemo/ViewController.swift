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
        
        
        var focusRoute: CLLocationCoordinate2D
        focusRoute = CLLocationCoordinate2DMake(37.910709, -122.215534)
        var span:MKCoordinateSpan = MKCoordinateSpanMake(1.1, 1.1)
        var region:MKCoordinateRegion  = MKCoordinateRegionMake(focusRoute, span)
        mapView.setRegion(region, animated:true)
        
        //now draw the spots on the mapview using Parse object named "CarpoolSpots"
        
    }
    
    @IBOutlet var mapView: MKMapView!
    

    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // When we first load the map view, we will check to see if the user is already logged in
        
    

        var work = CLLocationCoordinate2DMake(37.790533, -122.404622)
        var span:MKCoordinateSpan = MKCoordinateSpanMake(0.05, 0.05)
        var region:MKCoordinateRegion  = MKCoordinateRegionMake(work, span)
        mapView.setRegion(region, animated:true)
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}