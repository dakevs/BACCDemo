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
    

    @IBOutlet var txtUsername: UITextField!
    
    @IBOutlet var txtPassword: UITextField!
    
    @IBOutlet var txtConfirmPassword: UITextField!
    
    
    @IBAction func switchAction(value: Bool) {
        if value{
            txtConfirmPassword.hidden = false
        }else{
            txtConfirmPassword.hidden = true
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(animated: Bool) {
//        if PFUser.currentUser() != nil {
            //that means a user is logged in, and then we perform the segue to the map view
  //          self.performSegueWithIdentifier("gotoMap", sender: self)
        
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



