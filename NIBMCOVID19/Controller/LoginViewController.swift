//
//  LoginViewController.swift
//  NIBMCOVID19
//
//  Created by isuru rajapaksha on 9/17/2563 BE.
//  Copyright © 2563 BE RAJAPAKSHA R.W.I.A-COBSCCOMP191P039. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var ErrorLable: UILabel!
    
    @IBOutlet weak var EmailField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
setupelements()
        
    }
    

   func setupelements(){
       ErrorLable.alpha = 0
   }
    @IBAction func btnSignIn(_ sender: Any) {
    }
    
}
