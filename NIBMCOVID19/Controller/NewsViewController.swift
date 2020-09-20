//
//  NewsViewController.swift
//  NIBMCOVID19
//
//  Created by isuru rajapaksha on 9/20/2563 BE.
//  Copyright © 2563 BE RAJAPAKSHA R.W.I.A-COBSCCOMP191P039. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class NewsViewController: UIViewController {

    
    
    @IBOutlet weak var LabelNewsShow: UILabel!
    @IBOutlet weak var AddNewsText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        LabelNewsShow.alpha=0
        
    }
  
    

    @IBAction func btnAddNews(_ sender: Any) {
        LabelNewsShow.alpha=1
           let temp = AddNewsText.text
                      LabelNewsShow.text = temp
                
                let db = Firestore.firestore()
                db.collection("users").document("News").setData([
                    "NewNews": AddNewsText.text
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
            }
            
        }
