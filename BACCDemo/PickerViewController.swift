//
//  PickerViewController.swift
//  BACCDemo
//
//  Created by QA on 9/11/15.
//  Copyright (c) 2015 ShepherdsSoftware. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let carpoolCities = ["Alameda", "Albany", "Berkeley", "El Cerrito", "Emeryville", "Fairfield", "Hercules", "Lafayette", "Moraga", "Oakland", "Orinda", "Piedmont", "Richmond", "Vallejo", "San Francisco"]
    
    @IBOutlet var pickerCity: UIPickerView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerCity.dataSource = self;
        self.pickerCity.delegate = self;
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
   
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return carpoolCities.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return carpoolCities[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row:Int, inComponent component: Int) {
        //self.view.text = carpoolCities[row]
        
        //self.view.endEditing(true)
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
