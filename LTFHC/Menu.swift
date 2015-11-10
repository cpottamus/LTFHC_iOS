//
//  SelectMenu.swift
//  LTFHC
//
//  Created by Carson Potter on 10/21/15.
//  Copyright © 2015 CPot. All rights reserved.
//

import UIKit


class Menu: LTFHCViewController {
    override func viewDidLoad() {
        answerVC = PatientName()
        backVC = ChooseLanguage()
        super.viewDidLoad()
        self.title = "Menu"
     
        let intake = UIButton()
        intake.styleForApp("Enter Patient Into Register")
        intake.titleLabel!.font = UIFont(name: "Helvetica", size: 85)
        intake.addTarget(self, action: "menuButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(intake)
        
        let register = UIButton()
        register.styleForApp("View Register")
        register.titleLabel!.font = UIFont(name: "Helvetica", size: 85)
        register.addTarget(self, action: "menuButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(register)
        
        let report = UIButton()
        report.styleForApp("Generate Report")
        report.titleLabel!.font = UIFont(name: "Helvetica", size: 85)
        report.addTarget(self, action: "menuButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(report)
        
        
        let spacer = UIView(); let spacer2 = UIView(); let spacer3 = UIView(); let spacer4 = UIView(); self.view.addSubview(spacer); self.view.addSubview(spacer2); self.view.addSubview(spacer3); self.view.addSubview(spacer4);
        buildConstraints(intake, obj2: register, obj3: report, spacer: spacer, spacer2: spacer2, spacer3: spacer3, spacer4: spacer4)
        
    }
    
    func menuButtonPressed(sender: UIButton) {
        
        switch sender.titleLabel!.text!{
            case "Enter Patient Into Register":
                self.presentViewController(PatientName(), animated: false, completion: nil)
            case "View Register":
                self.presentViewController(PatientName(), animated: false, completion: nil) //Update to have Register
            case "Generate Report":
                self.presentViewController(PatientName(), animated: false, completion: nil) //Update to Generate Report
        default:
            print("Error :: switch not satisfied... check navigation options")
        }
    }
    
    
}

//MARK :: Constraints
extension Menu {
    func buildConstraints(obj1: UIButton, obj2: UIButton, obj3: UIButton, spacer: UIView, spacer2: UIView, spacer3: UIView, spacer4: UIView){
        let intake = obj1
        let register = obj2
        let report = obj3
        
        intake.translatesAutoresizingMaskIntoConstraints = false
        register.translatesAutoresizingMaskIntoConstraints = false
        report.translatesAutoresizingMaskIntoConstraints = false
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer2.translatesAutoresizingMaskIntoConstraints = false
        spacer3.translatesAutoresizingMaskIntoConstraints = false
        spacer4.translatesAutoresizingMaskIntoConstraints = false
        
        let spacerSize = NSLayoutConstraint(item: spacer, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute:NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 20)
        let spacer2Size = NSLayoutConstraint(item: spacer2, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute:NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 25)
        let spacer3Size = NSLayoutConstraint(item: spacer3, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute:NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 25)
        let spacer4Size = NSLayoutConstraint(item: spacer4, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute:NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 20)
        
        
        let topMargin = NSLayoutConstraint(item: spacer, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.topLayoutGuide, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: barHeight)
        let topIntake = NSLayoutConstraint(item: intake, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: spacer, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let topSpacer2 = NSLayoutConstraint(item: spacer2, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: intake, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let topRegister = NSLayoutConstraint(item: register, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: spacer2, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let topSpacer3 = NSLayoutConstraint(item: spacer3, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: register, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let topReport = NSLayoutConstraint(item: report, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: spacer3, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let topSpacer4 = NSLayoutConstraint(item: spacer4, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: report, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        
        let leftAlignment = NSLayoutConstraint(item: intake, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1, constant: 20)
        
        let rightAlignment = NSLayoutConstraint(item: self.view , attribute: NSLayoutAttribute.TrailingMargin, relatedBy: NSLayoutRelation.Equal, toItem: intake, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 20)
        
        let equalLeftAlignment = NSLayoutConstraint(item: intake, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: register, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        let equalLeftAlignment2 = NSLayoutConstraint(item: intake, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: report, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        let sameHeight = NSLayoutConstraint(item: intake, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: register, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        let equalRightAlignment = NSLayoutConstraint(item: intake, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: register, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        
        let sameHeight2 = NSLayoutConstraint(item: intake, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: report, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        let equalRightAlignment2 = NSLayoutConstraint(item: intake, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: report, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        
        let bottomMargin = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: spacer4, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([spacerSize, spacer2Size, spacer3Size, spacer4Size, topMargin, topIntake, topSpacer2, topRegister, topSpacer3, topReport, topSpacer4, leftAlignment, rightAlignment, equalLeftAlignment, equalLeftAlignment2, equalRightAlignment, equalRightAlignment2, sameHeight, sameHeight2, bottomMargin])
        
        
        
    }
}

