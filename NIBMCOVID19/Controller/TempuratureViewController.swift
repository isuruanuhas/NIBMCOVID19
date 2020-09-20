//
//  TempuratureViewController.swift
//  NIBMCOVID19
//
//  Created by isuru rajapaksha on 9/20/2563 BE.
//  Copyright © 2563 BE RAJAPAKSHA R.W.I.A-COBSCCOMP191P039. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class TempuratureViewController: UIViewController {

    @IBOutlet weak var tempLabel: UITextField!
    
    @IBOutlet weak var texttemp: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    

    
    @IBAction func Add_btn(_ sender: Any) {
        let temp = tempLabel.text
              texttemp.text = temp
        
        let db = Firestore.firestore()
        db.collection("users").document("temp").setData([
            "tempurature": tempLabel.text
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
}
