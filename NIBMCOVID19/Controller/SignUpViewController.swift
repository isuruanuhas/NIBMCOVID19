//
//  SignUpViewController.swift
//  NIBMCOVID19
//
//  Created by isuru rajapaksha on 9/17/2563 BE.
//  Copyright © 2563 BE RAJAPAKSHA R.W.I.A-COBSCCOMP191P039. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore


class SignUpViewController: UIViewController {
    @IBOutlet weak var ErrorLabel: UILabel!
    
    @IBOutlet weak var BtnSignup: UIButton!
    @IBOutlet weak var FirstNameLabel: UITextField!
    
    @IBOutlet weak var LastNameLabel: UITextField!
    
    @IBOutlet weak var EmailLable: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    
    @IBOutlet weak var RoleField: UITextField!
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
setupelements()
    }
    
    func setupelements(){
        ErrorLabel.alpha = 0
    }
    
    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
      func validateFields() -> String? {
          
          // Check that all fields are filled in
          if FirstNameLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
              LastNameLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            RoleField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
              EmailLable.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
              PasswordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
              
              return "Please fill in all fields."
          }
          
          // Check if the password is secure
          let cleanedPassword = PasswordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
          
          if Utilities.isPasswordValid(cleanedPassword) == false {
              // Password isn't secure enough
              return "Please make sure your password is at least 8 characters, contains a special character and a number."
          }
          
          return nil
      }
    @IBAction func btnSignup(_ sender: Any) {
            
            // Validate the fields
            let error = validateFields()
            
            if error != nil {
                
                // There's something wrong with the fields, show error message
                showError(error!)
            }
            else {
                
                // Create cleaned versions of the data
                let firstName = FirstNameLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let lastName = LastNameLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let role = RoleField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let email = EmailLable.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let password = PasswordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
                // Create the user
                Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                    
                    // Check for errors
                    if err != nil {
                        
                        // There was an error creating the user
                        self.showError("Error creating user")
                    }
                    else {
                        
                        // User was created successfully, now store the first name and last name
                        let db = Firestore.firestore()
                        
                        db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid, "role" :role ]) { (error) in
                            
                            if error != nil {
                                // Show error message
                                self.showError("Error saving user data")
                            }
                        }
                        
                        // Transition to the home screen
                        self.transitionToHome()
                    }
                    
                }
                
                
                
            }
        }
        
        func showError(_ message:String) {
            
            ErrorLabel.text = message
            ErrorLabel.alpha = 1
        }
        
        func transitionToHome() {
            
            let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
            
            view.window?.rootViewController = homeViewController
            view.window?.makeKeyAndVisible()
            
        }
        
    }
