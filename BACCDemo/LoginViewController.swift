//
//  LoginViewController.swift
//  BACCDemo
//
//  Created by QA on 8/11/15.
//  Copyright (c) 2015 ShepherdsSoftware. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    

    var registerUser = false
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet var txtUsername: UITextField!
    
    @IBOutlet var txtPassword: UITextField!
    
    @IBOutlet var txtConfirmPassword: UITextField!
    
    @IBOutlet var Switch: UISwitch!
    
   
    @IBAction func switchAction(sender: UISwitch) {
        if Switch.on {
            //user is in signup mode
            txtConfirmPassword.hidden = false
        } else {
            //user is in login mode
            txtConfirmPassword.hidden = true
        }
    }
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnSubmit(sender: UIButton) {
        
        if Switch.on {
            //user is in signup mode
            if txtPassword.text != txtConfirmPassword.text {
                //the password fields do not match
                displayAlert("Mismatched Passwords", message:"Please enter matching passwords")
           
            } else {
            //the password fields do match, and the user can register with this username/email and password
            
            }
            
        } else {
            //user is in login mode and we can submit credentials
        }
    }
    
    @IBAction func btnForgotPassword(sender: UIButton) {
        //after use taps this button the forgot password flow is begun
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(animated: Bool) {

        //if PFUser.currentUser() != nil {
        //that means a user is logged in, and then we perform the segue to the map view
        //self.performSegueWithIdentifier("gotoMap", sender: self)
        //}
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



