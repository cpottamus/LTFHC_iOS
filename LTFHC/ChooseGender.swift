//
//  SelectVillage.swift
//  LTFHC
//
//  Created by Carson Potter on 10/21/15.
//  Copyright © 2015 CPot. All rights reserved.
//

import UIKit


class ChooseGender: LTFHCViewController {
    
    override func viewDidLoad() {
        answerVC = PatientAge()
        backVC = PatientName()
        super.viewDidLoad()
        self.title = "Select Gender"
        
        //    let btn = UIButton()
        //    btn.styleForApp("Text here")
        //    btn.addTarget(self, action: "answerButtonPressed:", forControlEvents: .TouchUpInside)
        //    btn.frame = CGRectMake(150, 44, 60, 60)
        //    self.view.addSubview(btn)
        
        let male: UIButton = UIButton(type: UIButtonType.Custom)
        male.titleLabel!.text = "male"
        male.setImage(UIImage(named: "man.png"), forState: UIControlState.Normal)
        male.addTarget(self, action: "answerButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        male.frame = CGRectMake(639, 164, 219, 508)
        self.view.addSubview(male)
        
        let maleLabel = UILabel(frame: CGRectMake(669, 672, 110, 35))
        maleLabel.text = "Male"
        maleLabel.font = UIFont(name: "Helvetica", size: 28)
        maleLabel.textColor = UIColor.blackColor()
        self.view.addSubview(maleLabel)
        
        let female: UIButton = UIButton(type: UIButtonType.Custom)
        female.titleLabel!.text = "female"
        female.setImage(UIImage(named: "woman.png"), forState: UIControlState.Normal)
        female.addTarget(self, action: "answerButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        female.frame = CGRectMake(164, 164, 219, 508)
        self.view.addSubview(female)
        
        let femaleLabel = UILabel(frame: CGRectMake(230 , 672, 110, 45))
        femaleLabel.text = "Female"
        femaleLabel.font = UIFont(name: "Helvetica", size: 28)
        femaleLabel.textColor = UIColor.blackColor()
        self.view.addSubview(femaleLabel)
        
        //Add the label and the image to a view, and then place the views with spacers.
        
    }
    
}

