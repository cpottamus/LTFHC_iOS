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
        let labelFontSize = self.view.frame.height * 0.05
        
        let maleImg: UIButton = UIButton(type: UIButtonType.Custom)
        maleImg.titleLabel!.text = "male"
        maleImg.titleLabel?.adjustsFontSizeToFitWidth = true
        maleImg.setImage(UIImage(named: "man.png"), forState: UIControlState.Normal)
        maleImg.addTarget(self, action: "answerButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
//        male.frame = CGRectMake(639, 164, 219, 508)
//        self.view.addSubview(male)
        
        let maleLabel = UILabel()
        maleLabel.text = "Male"
        maleLabel.font = UIFont(name: "Helvetica", size: labelFontSize)
        maleLabel.textAlignment = NSTextAlignment.Center
        maleLabel.textColor = UIColor.blackColor()
//        self.view.addSubview(maleLabel)
        
        let femaleImg: UIButton = UIButton(type: UIButtonType.Custom)
        femaleImg.titleLabel!.text = "female"
        femaleImg.titleLabel?.adjustsFontSizeToFitWidth = true
        femaleImg.setImage(UIImage(named: "woman.png"), forState: UIControlState.Normal)
        femaleImg.addTarget(self, action: "answerButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
//        female.frame = CGRectMake(164, 164, 219, 508)
//        self.view.addSubview(female)
        
        let femaleLabel = UILabel()
        femaleLabel.text = "Female"
        femaleLabel.font = UIFont(name: "Helvetica", size: labelFontSize)
        femaleLabel.textAlignment = NSTextAlignment.Center
        femaleLabel.textColor = UIColor.blackColor()
//        self.view.addSubview(femaleLabel)
        
        //Add the label and the image to a view, and then place the views with spacers.
        let maleView: UIView! = UIView()
        let femaleView: UIView! = UIView()
        
        buildConstraints(maleImg, femaleImg: femaleImg, maleLabel: maleLabel, femaleLabel: femaleLabel, maleView: maleView, femaleView: femaleView)
        
    }
    
    
}


//MARK :: Constraints
extension ChooseGender {
    func buildConstraints(maleImg: UIButton, femaleImg: UIButton, maleLabel: UILabel, femaleLabel: UILabel, maleView: UIView, femaleView: UIView) {
        
        maleView.addSubview(maleImg); maleView.addSubview(maleLabel); femaleView.addSubview(femaleImg); femaleView.addSubview(femaleLabel)
        self.view.addSubview(maleView); self.view.addSubview(femaleView)
        maleImg.translatesAutoresizingMaskIntoConstraints = false; femaleImg.translatesAutoresizingMaskIntoConstraints = false; maleLabel.translatesAutoresizingMaskIntoConstraints = false; femaleLabel.translatesAutoresizingMaskIntoConstraints = false; maleView.translatesAutoresizingMaskIntoConstraints = false; femaleView.translatesAutoresizingMaskIntoConstraints = false
        
        let vMargin = self.view.frame.height * 0.08
        let hMargin = self.view.frame.height * 0.25
        let labelHeight = self.view.frame.height * 0.05
        
        let bindings: [String: AnyObject] = ["maleImg": maleImg, "femaleImg": femaleImg, "maleLabel": maleLabel, "femaleLabel": femaleLabel, "maleView": maleView, "femaleView": femaleView, "topGuide": self.topLayoutGuide, "bottomGuide": self.bottomLayoutGuide]
        let metrics = ["vMargin": vMargin, "hMargin": hMargin, "labelHeight": labelHeight]

        //Layout View
        let equalWidthMaleFemale = NSLayoutConstraint.constraintsWithVisualFormat("H:[maleView(==femaleView)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindings)
        self.view.addConstraints(equalWidthMaleFemale)
        let horizontalLayout = NSLayoutConstraint.constraintsWithVisualFormat("H:|-hMargin-[femaleView]-hMargin-[maleView]-hMargin-|", options: [NSLayoutFormatOptions.AlignAllTop, NSLayoutFormatOptions.AlignAllBottom], metrics: metrics, views: bindings)
        self.view.addConstraints(horizontalLayout)
        let verticalLayout = NSLayoutConstraint.constraintsWithVisualFormat("V:|[topGuide]-vMargin-[maleView]-vMargin-[bottomGuide]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: bindings)
        self.view.addConstraints(verticalLayout)
        
        //Layout Male/Female Subviews
        let maleVerticalLayout = NSLayoutConstraint.constraintsWithVisualFormat("V:|[maleImg][maleLabel(labelHeight)]|", options: [NSLayoutFormatOptions.AlignAllLeading, NSLayoutFormatOptions.AlignAllTrailing], metrics: metrics, views: bindings)
        self.view.addConstraints(maleVerticalLayout)
        let maleHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|[maleLabel]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindings)
        self.view.addConstraints(maleHorizontal)
        let femaleVerticalLayout = NSLayoutConstraint.constraintsWithVisualFormat("V:|[femaleImg][femaleLabel(labelHeight)]|", options: [NSLayoutFormatOptions.AlignAllLeading, NSLayoutFormatOptions.AlignAllTrailing], metrics: metrics, views: bindings)
        self.view.addConstraints(femaleVerticalLayout)
        let femaleHorizontal = NSLayoutConstraint.constraintsWithVisualFormat("H:|[femaleLabel]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindings)
        self.view.addConstraints(femaleHorizontal)
        
        
    }
    
}

