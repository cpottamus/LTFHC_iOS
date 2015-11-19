//
//  LTFHCViewController.swift
//  LTFHC
//
//  Created by Carson Potter on 10/9/15.
//  Copyright © 2015 CPot. All rights reserved.
//

/*===============================================================================================

This is the ViewController Model. It will declare and style the navigation bars, it will also interpret the configurables.swift file and label w/ the appropriate language.
If possible, we should do data management here as well, passing things off to DataStore to be saved.

================================================================================================*/

import UIKit
import CoreData

class LTFHCViewController: UIViewController, UINavigationControllerDelegate {
    
    //Declare Class-level variables for use.
    var buttonFontHeight: CGFloat!
    
    //ViewControllers for future answers
    var answerVC: UIViewController!
    var altAnswerVC: UIViewController!
    var backVC: UIViewController!
    
    //Record
    var user: NSManagedObject!
    
    convenience init(userObject: NSManagedObject!) {
        self.init()
        user = userObject
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Style Navigation Bar//
        
        //Set Constants
        barHeight = self.view.frame.height * 0.115
        
        buttonFontHeight = self.view.frame.height * 0.1
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Helvetica", size: self.view.frame.height * 0.08)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        //        self.navigationController?.navigationBarHidden = false
        self.title = "Default"
        self.setNeedsStatusBarAppearanceUpdate()
        
        //Left Bar Button
        let frame = CGRectMake(0,0, self.view.frame.height * 0.13, self.view.frame.height * 0.076)
        let btn: UIButton = UIButton(type: UIButtonType.Custom)
        btn.setImage(UIImage(named: "backArrow.png"), forState: UIControlState.Normal)
        btn.addTarget(self, action: "backButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        btn.frame = frame
        let lftBarBtn: UIBarButtonItem = UIBarButtonItem(customView: btn)
        navigationItem.leftBarButtonItem = lftBarBtn
        
        //Right Bar Button
        let btn2: UIButton = UIButton(type: UIButtonType.Custom)
        btn2.setImage(UIImage(named: "forwardArrow.png"), forState: UIControlState.Normal)
        btn2.addTarget(self, action: "nextButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        btn2.frame = frame
        let rghtBarBtn: UIBarButtonItem = UIBarButtonItem(customView: btn2)
        navigationItem.rightBarButtonItem = rghtBarBtn
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//MARK :: Data Management Functions
extension LTFHCViewController{
    
    func answerButtonPressed(sender: UIButton){
        saveAttribute(sender.titleLabel?.text)
        navigationController?.pushViewController(answerVC, animated: false)
        
    }
    
//    func altAnswerButtonPressed(sender: UIButton){
//        navigationController?.pushViewController(answerVC, animated: false)
//    }
    
    func nextButtonPressed(sender: UIButton){
        saveAttribute("")
        navigationController?.pushViewController(answerVC, animated: false)
    }
    
    func backButtonPressed(sender: UIButton){
        navigationController?.popViewControllerAnimated(false)
    }
    
    func saveAttribute(fieldValueString: String!) {
        var fieldKey: String!
        var type: String = "String"
        
        //Can I abstract this away?
        //TODO Replace cases with variables.
        switch self.title! {
        case "Patient Name": fieldKey = "patientName"
        case "Select Gender": fieldKey =  "patientGender"
        case "Patient Age": fieldKey =  "patientAge"; type = "Integer";
        case "Patient Weight": fieldKey =  "patientWeight"; type = "Integer";
        case "Patient Height": fieldKey =  "patientHeight"; type = "Integer";
        case "Patient Village": fieldKey =  "patientVillage"
        case "Test Done": fieldKey =  "testDone"
        case "Test Result": fieldKey =  "testResult"
        case "Diagnosis": fieldKey =  "diagnosis"
        case "Treatment Done": fieldKey =  "treatmentDone"
        case "Route": fieldKey =  "treatmentRoute"
        case "Dose Given": fieldKey =  "doseGiven"; type = "Integer";
        case "Result": fieldKey =  "visitResult"
        case "Comments": fieldKey =  "comments"
        case "Comments (optional)": fieldKey = "additionalComments"
        case "Choose Language": fieldKey = "visitLanguage"
        default: print("Fatal Error: DB not found")
        }

        print("Updated \(fieldKey)")
        if type == "String" {
            user.setValue(fieldValueString, forKey: fieldKey)
        } else if type == "Integer" {
            //cast as integer and add to object
            user.setValue(Int(fieldValueString), forKey: fieldKey)
        }
        
        //Save Context
        do {
            try DataStore.instance.privateContext.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    func createNewUserObject() {
        user = NSEntityDescription.insertNewObjectForEntityForName("Register", inManagedObjectContext: DataStore.instance.privateContext)
        print("New User Record Created")
    }
}

