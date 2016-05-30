//
//  HomeViewController.swift
//  Twoefay
//
//  Created by Anthony Nguyen on 5/5/16.
//  Copyright © 2016 Twoefay. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    let prefs = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // check if there is an id_token saved
        let prefs = NSUserDefaults.standardUserDefaults()
        if let my_id_token = prefs.stringForKey("my_id_token") {
            print("HomePage Loaded, my_id_token: \(my_id_token)")
        }
        // since there is no id_token saved, need to get one
        else {
            performSegueWithIdentifier("getTokenSegue", sender: "")
        }
        
        
        /**
         DEV ONLY
         */
        let dev_mode = true
        if dev_mode == true {
            // Sample Login Requests
            LoginRequestManager.clearRealmData()
            LoginRequestManager.loadSampleData()
            // Sample Secret TOTP Accounts
            OTP.clearOTPData()
            OTP.loadSampleData()
        }
    }
    
    @IBAction func logout(sender: AnyObject) {
        prefs.removeObjectForKey("my_id_token")
        performSegueWithIdentifier("getTokenSegue", sender: "")
    }

    
    @IBAction func unwindToHome(segue:UIStoryboardSegue) {
        
    }
}
