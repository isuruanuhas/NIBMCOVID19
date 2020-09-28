//
//  NIBMCOVID19UITests.swift
//  NIBMCOVID19UITests
//
//  Created by isuru rajapaksha on 9/28/2563 BE.
//  Copyright © 2563 BE RAJAPAKSHA R.W.I.A-COBSCCOMP191P039. All rights reserved.
//

import XCTest

class NIBMCOVID19UITests: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false

        }
    
    func testMap()
    {
        
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.staticTexts["Home"]/*[[".buttons[\"Home\"].staticTexts[\"Home\"]",".staticTexts[\"Home\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Back"]/*[[".buttons[\"Back\"].staticTexts[\"Back\"]",".staticTexts[\"Back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
       
        
    }
    
    
    
    func testTips()
    {
        
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.staticTexts["Safe Actions"]/*[[".buttons[\"Safe Actions\"].staticTexts[\"Safe Actions\"]",".staticTexts[\"Safe Actions\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let nextStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Next"]/*[[".buttons[\"Next\"].staticTexts[\"Next\"]",".staticTexts[\"Next\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nextStaticText.tap()
        nextStaticText.tap()
        nextStaticText.tap()
        nextStaticText.tap()
        nextStaticText.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Home"]/*[[".buttons[\"Home\"].staticTexts[\"Home\"]",".staticTexts[\"Home\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    

    
    
    
    
    
    func testlogin(){

        
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.staticTexts["Add"]/*[[".buttons[\"Add\"].staticTexts[\"Add\"]",".staticTexts[\"Add\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Already Have an Account?"]/*[[".buttons[\"Already Have an Account?\"].staticTexts[\"Already Have an Account?\"]",".staticTexts[\"Already Have an Account?\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        let userName = "Email@gmail.com"
        let passWord = "Password@123"
        
        
        let usernameTextField =  app.textFields["Email"]
        let passwordTextField =  app.textFields["Password"]
        usernameTextField.typeText(userName)
        passwordTextField.typeText(passWord)
        app.buttons["SignIn"].tap()
            
    }
    
    

    
    
    

    
}




