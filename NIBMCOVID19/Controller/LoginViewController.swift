//
//  LoginViewController.swift
//  NIBMCOVID19
//
//  Created by isuru rajapaksha on 9/17/2563 BE.
//  Copyright © 2563 BE RAJAPAKSHA R.W.I.A-COBSCCOMP191P039. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var ErrorLable: UILabel!
    
    @IBOutlet weak var EmailField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
setupelements()
        // Do any additional setup after loading the view.
            
            setUpElements()
        }
        
        func setUpElements() {
            
            // Hide the error label
            ErrorLable.alpha = 0
            
            
    }
    

   func setupelements(){
       ErrorLable.alpha = 0
   }
    @IBAction func btnSignIn(_ sender: Any) {
        
        // TODO: Validate Text Fields
               
               // Create cleaned versions of the text field
               let email = EmailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
               let password = PasswordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    
                    if error != nil {
                        // Couldn't sign in
                        self.ErrorLable.text = error!.localizedDescription
                        self.ErrorLable.alpha = 1
                    }
                    else {
                        
                        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                        
                        self.view.window?.rootViewController = homeViewController
                        self.view.window?.makeKeyAndVisible()
                    }
                }
            }
            
        }

