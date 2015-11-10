
//
//  ChooseLanguage.swift
//  LTFHC
//
//  Created by Carson Potter on 10/21/15.
//  Copyright © 2015 CPot. All rights reserved.
//

import UIKit


class ChooseLanguage: LTFHCViewController {
    
    override func viewDidLoad() {
        answerVC = Menu()
        super.viewDidLoad()
        //self.navigationController?.navigationBarHidden = true
        self.title = "Choose Language"
        
        
        
        let eng = UIButton()
        eng.styleForApp("English")
        eng.titleLabel!.font = UIFont(name: "Helvetica", size: 85)
        eng.addTarget(self, action: "answerButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(eng)
        
        let swa = UIButton()
        swa.styleForApp("Swahili")
        swa.titleLabel!.font = UIFont(name: "Helvetica", size: 85)
        swa.addTarget(self, action: "answerButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(swa)
        
        buildConstraints(eng, obj2: swa)
        
        
    }
    
    
    override func answerButtonPressed(sender: UIButton) {
        language = sender.titleLabel!.text!
        super.answerButtonPressed(sender)
    }
    
}


//MARK :: Constraints
extension ChooseLanguage {
    func buildConstraints(obj1: UIButton, obj2: UIButton){
        let eng = obj1 
        let swa = obj2 
        
        
        eng.translatesAutoresizingMaskIntoConstraints = false //May need to move these above where we add them to view.
        swa.translatesAutoresizingMaskIntoConstraints = false
        
        let topMargin = NSLayoutConstraint(item: eng, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.topLayoutGuide, attribute: NSLayoutAttribute.Bottom, multiplier: 1.2, constant: barHeight+10)

        let leftAlignment = NSLayoutConstraint(item: eng, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1, constant: 20)
        
        let rightAlignment = NSLayoutConstraint(item: self.view , attribute: NSLayoutAttribute.TrailingMargin, relatedBy: NSLayoutRelation.Equal, toItem: eng, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 20)
        
        let equalLeftAlignment = NSLayoutConstraint(item: eng, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: swa, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        let sameHeight = NSLayoutConstraint(item: eng, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: swa, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        
        let equalRightAlignment = NSLayoutConstraint(item: eng, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: swa, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        
        let middleMargin = NSLayoutConstraint(item: swa, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: eng, attribute: NSLayoutAttribute.Bottom, multiplier: 1.2, constant: 20)
        
        let bottomMargin = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: swa, attribute: NSLayoutAttribute.Bottom, multiplier: 1.1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([topMargin, leftAlignment, equalLeftAlignment, sameHeight, equalRightAlignment, middleMargin, bottomMargin, rightAlignment])
        
        
        
    }
}