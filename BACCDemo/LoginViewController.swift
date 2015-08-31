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
            
        } else {
            //user is in login mode
            txtConfirmPassword.enabled = false
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
                    var user = PFUser()
                    user.username = txtUsername.text
                    user.password = txtPassword.text
                    // other fields can be set just like with PFObject
                    
                    user.signUpInBackgroundWithBlock {
                        (succeeded: Bool, error: NSError?) -> Void in
                        if let error = error {
                            let errorString = error.userInfo?["error"] as! String
                            // Show the errorString somewhere and let the user try again.
                            self.displayAlert("Signup Error", message: errorString)
                        } else {
                            // Hooray! Let them use the app now.
                            self.performSegueWithIdentifier("gotoMap", sender: self)
                        }
                    }                }
            } else {
                //user is in login mode and we can submit credentials
                PFUser.logInWithUsernameInBackground(txtUsername.text, password:txtPassword.text) {
                    (user: PFUser?, error: NSError?) -> Void in
                        if user != nil {
                            // Do stuff after successful login.
                            self.performSegueWithIdentifier("gotoMap", sender: self)
                        } else {

                            // The login failed. Check error to see why.
  
                    }

                }
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

        if PFUser.currentUser()?.username != nil {

            //that means a user is logged in, and then we perform the segue to the map view
            //dont forget to check for temp users as well**** TO DO ****
            self.performSegueWithIdentifier("gotoMap", sender: self)
          
        } else {
            //there is no user logged in, OR there is no temporary user, and we then display the login screen.
        }
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




