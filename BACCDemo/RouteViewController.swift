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
    
    
        let carpoolCities = ["Alameda", "Albany", "Berkeley", "El Cerrito", "Emeryville", "Fairfield", "Hercules", "Lafayette", "Moraga", "Oakland", "Orinda", "Piedmont", "Richmond", "Vallejo", "San Francisco"]

    
    @IBOutlet var pickerCity: UIPickerView!
    
    
    @IBOutlet weak var txtStartingCity: IQDropDownTextField!
    
    
    @IBOutlet weak var txtEndingCity: IQDropDownTextField!
   
    @IBAction func btnReverse(sender: AnyObject) {
        
        //a pop up dialog will show, then if user hits yes,  we reverse starting and destination cities
        let currentStartCity = txtStartingCity.text
        let currentEndCity = txtEndingCity.text
        
        txtStartingCity.text = currentEndCity
        
        txtEndingCity.text = currentStartCity
    }
    
    @IBAction func btnSave(sender: AnyObject) {
        
        
        if txtEndingCity.text == txtStartingCity.text {
            
            displayAlert("Invalid Data", message: "Start and End city can not be the same.")

        } else {
        
            //save to the user object
        }
        
        
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

        txtStartingCity.isOptionalDropDown = false
        txtStartingCity.itemList = carpoolCities
        txtEndingCity.isOptionalDropDown = false
        txtEndingCity.itemList = carpoolCities
        
        

        //make sure the picker wheel isn't showing
        

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
 