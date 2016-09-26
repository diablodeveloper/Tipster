//
//  ViewController.swift
//  Tipster
//
//  Created by Praful Gupta on 9/20/16.
//  Copyright © 2016 Praful Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        billField.keyboardType = UIKeyboardType.decimalPad
        // Do any additional setup after loading the view, typically from a nib.
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTipValue(_ sender: AnyObject) {
        
        let billAmt = Double(billField.text!) ?? 0
        let tipPercentages = [0.10, 0.15, 0.18, 0.20]
        
        let tipAmt = billAmt * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = billAmt + tipAmt
        
        tipLabel.text = String.init(format: "$%.2f", tipAmt)
        totalLabel.text = String.init(format: "$%.2f", total)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var defaults = UserDefaults.standard
        var intValue = defaults.integer(forKey: "defaultPercentageIndex")
       
        tipControl.selectedSegmentIndex = intValue
        calculateTipValue(animated as AnyObject)
        // Optionally initialize the property to a desired starting value
        
    }
}

