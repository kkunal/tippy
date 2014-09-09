//
//  SettingsViewController.swift
//  tippy
//
//  Created by Kunal Kshirsagar on 9/6/14.
//  Copyright (c) 2014 Yahoo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSegmentControl: UISegmentedControl!
    @IBOutlet weak var currencySegmentControl: UISegmentedControl!
    @IBOutlet weak var themeSegmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        var defaults = NSUserDefaults.standardUserDefaults()
        var defTip = defaults.integerForKey("default_tip_percentage")
        var defCurrency = defaults.integerForKey("default_currency")
        var defTheme = defaults.integerForKey("default_theme")
        tipSegmentControl.selectedSegmentIndex = defTip - 1
        currencySegmentControl.selectedSegmentIndex = defCurrency - 1
        themeSegmentControl.selectedSegmentIndex = defTheme - 1
        defaults.synchronize()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSave(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipSegmentControl.selectedSegmentIndex+1, forKey: "default_tip_percentage")
        defaults.setInteger(currencySegmentControl.selectedSegmentIndex+1, forKey: "default_currency")
        defaults.setInteger(themeSegmentControl.selectedSegmentIndex+1, forKey: "default_theme")
        defaults.synchronize()
        dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
