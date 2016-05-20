//
//  TokenViewController.swift
//  Twoefay
//
//  Created by Jonathan Woong on 5/19/16.
//  Copyright © 2016 Twoefay. All rights reserved.
//

import UIKit
import OneTimePassword

class TokenViewController: UIViewController {
    
    @IBOutlet weak var tokenLabel: UILabel!
    
    var tokenIdentifier: NSData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uses the get_token function in the file MyOneTimePassword.swift
        let current_token = get_token(self.tokenIdentifier!)
        let current_password = get_password(current_token!)
        self.tokenLabel.text = current_password!
        
        // update label every 30 seconds
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 }
