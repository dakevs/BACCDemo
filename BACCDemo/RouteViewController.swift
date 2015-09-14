//
//  RouteViewController.swift
//  BACCDemo
//
//  Created by QA on 9/9/15.
//  Copyright (c) 2015 ShepherdsSoftware. All rights reserved.
//

import UIKit
import Parse

class RouteViewController: UIViewController {
    
    @IBOutlet var pickerCity: UIPickerView!
    
        @IBAction func btnReverse(sender: AnyObject) {
        
        //a pop up dialog will show, then if user hits yes,  we reverse starting and destination cities
        
    }
    
    @IBAction func btnSave(sender: AnyObject) {
        
        /*perform data validation here so we don't have to do any fancy stuff with the picker wheel data sources.

        
       // if pickerStartingCity.isEqual(pickerDestinationCity){
        
            //if starting city == destination city, pop an error.
         //   displayAlert("Missing Field(s)", message: "Please enter both a username and password")

        //} else {
        
            println("They're different")
        
        }*/
        
    }
    
    
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            })))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
 