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
        
        var sanFranPickup, sanFranDropoff, vallejo1, vallejo2, alameda1, alameda2, oakland1, oakland2, fairfield: MKPointAnnotation
        var sanFranPickupLoc, sanFranDropoffLoc, vallejoLoc1, vallejoLoc2, alamedaLoc1, alamedaLoc2, oaklandLoc1, oaklandLoc2, fairfieldLoc, focusRoute: CLLocationCoordinate2D
     
        //For the demo, we will do a quick hack to draw the points to show the expected UX
        //Eventually, these will be saved to Parse as their geolocation Objects
        
        /*
        Fairfield - Corner of Cadenasso Dr. and Magellan Rd. - 38.248371, -122.068798
        Alameda - Near Encinal & Park Ave. - 37.761952, -122.243130
        Alameda - Near Webster St. & Santa Clara Ave. - 37.773310, -122.276736
        San Francisco - Dropoff Location - 37.788587, -122.394394
        San Francisco - Pickup Location - 37.789986, -122.391808
        Vallejo - Near Lemon St. - 38.092574, -122.235227
        Vallejo - Near Vallejo Transit Center/Downton - 38.099198, -122.260491
        Oakland - Claremont & College Ave. East of College, north of Claremont- 37.850371, -122.251496
        Oakland - Park Blvd. & Hollywood Ave. Near TransBay bus stops between Trestle Glen & Hollywood. - 37.811435, -122.215483
        */
     
        sanFranPickup = MKPointAnnotation()
        sanFranPickupLoc = CLLocationCoordinate2DMake(37.761952, -122.243130)
        sanFranPickup.coordinate = sanFranPickupLoc
        sanFranPickup.title = "San Francisco Carpool"
        sanFranPickup.subtitle = "Pickup location for Casual Carpoolers leaving San Francisco"
        self.mapView.addAnnotation(sanFranPickup)
        
        sanFranDropoff = MKPointAnnotation()
        sanFranDropoffLoc = CLLocationCoordinate2DMake(37.788587, -122.394394)
        sanFranDropoff.coordinate = sanFranDropoffLoc
        sanFranDropoff.title = "San Francisco Carpool Dropoff"
        sanFranDropoff.subtitle = "Dropoff location for Casual Carpoolers arriving in San Francisco"
        self.mapView.addAnnotation(sanFranDropoff)

        vallejo1 = MKPointAnnotation()
        vallejoLoc1 = CLLocationCoordinate2DMake(38.092574, -122.235227)
        vallejo1.coordinate = vallejoLoc1
        vallejo1.title = "Vallejo Casual Carpool"
        vallejo1.subtitle = "Near Lemon St."
        self.mapView.addAnnotation(vallejo1)
        
        
        vallejo2 = MKPointAnnotation()
        vallejoLoc2 = CLLocationCoordinate2DMake(38.099198, -122.260491)
        vallejo2.coordinate = vallejoLoc2
        vallejo2.title = "Vallejo Casual Carpool"
        vallejo2.subtitle = "Near Downtown Vallejo & Transit Center"
        self.mapView.addAnnotation(vallejo2)
        
        alameda1 = MKPointAnnotation()
        alamedaLoc1 = CLLocationCoordinate2DMake(37.761952, -122.243130)
        alameda1.coordinate = alamedaLoc1
        alameda1.title = "Alameda Casual Carpool"
        alameda1.subtitle = "Near Encinal & Park Ave."
        self.mapView.addAnnotation(alameda1)
        
        alameda2 = MKPointAnnotation()
        alamedaLoc2 = CLLocationCoordinate2DMake(37.773310, -122.276736)
        alameda2.coordinate = alamedaLoc2
        alameda2.title = "Alameda Casual Carpool"
        alameda2.subtitle = "Near Webster St. & Santa Clara Ave."
        self.mapView.addAnnotation(alameda2)
        
        oakland1 = MKPointAnnotation()
        oaklandLoc1 = CLLocationCoordinate2DMake(37.850371, -122.251496)
        oakland1.coordinate = oaklandLoc1
        oakland1.title = "Oakland Casual Carpool"
        oakland1.subtitle = "Claremont & College Ave. East of College, north of Claremont"
        self.mapView.addAnnotation(oakland1)
        
        oakland2 = MKPointAnnotation()
        oaklandLoc2 = CLLocationCoordinate2DMake(37.811435, -122.215483)
        oakland2.coordinate = oaklandLoc2
        oakland2.title = "Oakland Casual Carpool"
        oakland2.subtitle = "Near Lemon St."
        self.mapView.addAnnotation(oakland2)
        
        fairfield = MKPointAnnotation()
        fairfieldLoc = CLLocationCoordinate2DMake(38.248371, -122.068798)
        fairfield.coordinate = fairfieldLoc
        fairfield.title = "Fairfield Casual Carpool"
        fairfield.subtitle = "Near Lemon St."
        self.mapView.addAnnotation(vallejo1)
        
        
        focusRoute = CLLocationCoordinate2DMake(37.910709, -122.215534)
        var span:MKCoordinateSpan = MKCoordinateSpanMake(1.1, 1.1)
        var region:MKCoordinateRegion  = MKCoordinateRegionMake(focusRoute, span)
        mapView.setRegion(region, animated:true)
        
        
        
        
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