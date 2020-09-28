//
//  IDViewController.swift
//  NIBMCOVID19
//
//  Created by isuru rajapaksha on 9/28/2563 BE.
//  Copyright © 2563 BE RAJAPAKSHA R.W.I.A-COBSCCOMP191P039. All rights reserved.
//

import UIKit
import LocalAuthentication

class IDViewController: UIViewController {
    @IBOutlet weak var btnID: UIButton!
    @IBAction func btnID(_ sender: Any) {
          
          let context :LAContext=LAContext()
          
          if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
          {
              context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "SecurityPurpose") { (good, error) in
                  
                  if good
                  {
                      self.navigateto()
                  }
                  else{
                      print("Try Again")
                  }
              }
          }
          
          
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

  
    func navigateto(){
    let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
    
    view.window?.rootViewController = homeViewController
    view.window?.makeKeyAndVisible()
    }
}
