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
    
    var signupActive = false //aka "login mode
    
    
    @IBOutlet var txtUsername: UITextField!
    
    @IBOutlet var txtPassword: UITextField!
    
    @IBOutlet var lblRegistered: UILabel!
    
    
    /////////
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    //////////////
    

    @IBAction func btnLogin(sender: UIButton) {
        var errorMessage = "Please try again later"
        
        if txtUsername.text == "" || txtPassword.text == "" {
            
            displayAlert("Error in form", message: "Please enter a username and password")
            
        } else {
            //since the user is seeing the login button, we will call the login function here
            
            PFUser.logInWithUsernameInBackground(txtUsername.text, password: txtPassword.text, block: { (user, error) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if user != nil {
                    
                    // Logged In!
                    
                } else {
                    
                    if let errorString = error!.userInfo?["error"] as? String {
                        
                        errorMessage = errorString
                        
                    }
                    
                    self.displayAlert("Failed Login", message: errorMessage)
                    
                }
                
            })
        }
        
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



