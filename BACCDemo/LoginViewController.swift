//
//  LoginViewController.swift
//  BACCDemo
//
//  Created by QA on 8/11/15.
//  Copyright (c) 2015 ShepherdsSoftware. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {
    

    var registerUser = false
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet var txtUsername: UITextField!
    
    @IBOutlet var txtPassword: UITextField!
    
    @IBOutlet var txtConfirmPassword: UITextField!
    
    @IBOutlet var Switch: UISwitch!
    
   
    @IBAction func switchAction(sender: UISwitch) {
        if Switch.on {
            //user is in signup mode
            txtConfirmPassword.enabled = true
            txtConfirmPassword.text == "";
            
        } else {
            //user is in login mode
            txtConfirmPassword.enabled = false
            txtConfirmPassword.text == "";
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
        if txtUsername.text == "" || txtPassword.text == "" {
            //they're missing a username or password
            displayAlert("Missing Field(s)", message: "Please enter both a username and password")
        } else {
            //we check if they're in signup/login mode
            if Switch.on {
                //user is in signup mode
                if txtPassword.text != txtConfirmPassword.text {
                    //the password fields do not match
                    displayAlert("Mismatched Passwords", message: "Please enter matching passwords")
                } else {
                    //the password fields do match, and the user can register with this username/email and password
                }
            } else {
                //user is in login mode and we can submit credentials
                }
        }
    }


    @IBAction func btnForgotPassword(sender: UIButton) {
        //after use taps this button the forgot password flow is begun
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)        // Do any additional setup after loading the view.
        
        self.txtConfirmPassword.delegate = self;
        self.txtUsername.delegate = self;
        self.txtPassword.delegate = self;
        
    }
    
    func DismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        txtPassword.resignFirstResponder()
        txtConfirmPassword.resignFirstResponder()
        txtUsername.resignFirstResponder()
        return true
    }
}
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */




