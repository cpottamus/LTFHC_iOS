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

class LTFHCViewController: UIViewController, UINavigationControllerDelegate {
    
    //Declare Class-level variables for use.
    var buttonFontHeight: CGFloat!
    
    //ViewControllers for future answers
    var answerVC: UIViewController!
    var altAnswerVC: UIViewController!
    var backVC: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        //key is assigned based off of navTitle
        //value is sender.         if let text = sender!.titleLabel?.text
        print(sender.titleLabel!.text!)
        navigationController?.pushViewController(answerVC, animated: false)
        
        
        //        var dbField = getEntityKey(self.title!)
        //Call the context and the datastore stuff here, save the piece.
        
    }
    
    func altAnswerButtonPressed(sender: UIButton){
        //key is assigned based off of navTitle
        //value is sender.         if let text = sender.titleLabel?.text
        print(sender.titleLabel!.text!)
        navigationController?.pushViewController(answerVC, animated: false)
    }
    
    func nextButtonPressed(sender: UIButton){
        navigationController?.pushViewController(answerVC, animated: false)
    }
    
    func backButtonPressed(sender: UIButton){
        navigationController?.popViewControllerAnimated(false)
    }
    
    func getEntityKey(title: String) -> String {
        
        //Can I abstract this away?
        switch title {
        case "Patient Village": return "patientVillage"
            //Add additional database fields
        default: return "database field not found"
        }
    }
}

