//
//  ViewController.swift
//  tippy
//
//  Created by Kunal Kshirsagar on 9/2/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!                          
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "0.00"
        totalLabel.text = "0.00"
        var defaults = NSUserDefaults.standardUserDefaults()
        var defTip = defaults.integerForKey("default_tip_percentage")
         var defCurrency = defaults.integerForKey("default_currency")
         var defTheme = defaults.integerForKey("default_theme")
        println("default tip: " + "\(defTip)")
        if(defTip == 0) {
            defTip = 1
            defaults.setInteger(defTip, forKey: "default_tip_percentage")
            defaults.setInteger(defTip, forKey: "default_currency")
            defaults.setInteger(defTip, forKey: "default_theme")
            defaults.synchronize()
        }
        var currencies = ["$","Rs. "]
        
        tipControl.selectedSegmentIndex = defTip
        tipLabel.text = currencies[defCurrency-1] + tipLabel.text!
        totalLabel.text = currencies[defCurrency-1] + totalLabel.text!
        if(defTheme-1 == 1) {
            self.view.backgroundColor = UIColor.grayColor()
            tipControl.backgroundColor = UIColor.lightTextColor()
        } else {
            self.view.backgroundColor = UIColor.whiteColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func onEditingChange(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var currencies = ["$","Rs. "]
        
        tipLabel.text = NSString(format: "%.2f", tip)
        totalLabel.text = NSString(format: "%.2f", total)
         var defaults = NSUserDefaults.standardUserDefaults()
         var defCurrency = defaults.integerForKey("default_currency")
        tipLabel.text = currencies[defCurrency-1] + tipLabel.text!
        totalLabel.text = currencies[defCurrency-1] + totalLabel.text!
        var defTheme = defaults.integerForKey("default_theme")
        if(defTheme-1 == 1) {
            self.view.backgroundColor = UIColor.grayColor()
        }else {
            self.view.backgroundColor = UIColor.whiteColor()
        }
        defaults.synchronize()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        self.view.endEditing(true);
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
         var defaults = NSUserDefaults.standardUserDefaults()
        var defTip = defaults.integerForKey("default_tip_percentage")
        tipControl.selectedSegmentIndex = defTip - 1
        onEditingChange(self);
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }


}

