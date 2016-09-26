//
//  SettingsViewController.swift
//  Tipster
//
//  Created by Kenandy Spare A2 on 9/20/16.
//  Copyright © 2016 Praful Gupta. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tipDefaultControl: UISegmentedControl!
    
     let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let intValue = defaults.integer(forKey: "defaultPercentageIndex")
        tipDefaultControl.selectedSegmentIndex = intValue
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveDefaultValue(_ sender: AnyObject) {
        print("default saved: ", tipDefaultControl.selectedSegmentIndex)
        defaults.set(tipDefaultControl.selectedSegmentIndex, forKey: "defaultPercentageIndex")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
