//
//  SelectVillage.swift
//  LTFHC
//
//  Created by Carson Potter on 10/21/15.
//  Copyright © 2015 CPot. All rights reserved.
//

import UIKit


import UIKit


class PatientHeight: LTFHCViewController {
    
    var fld: UITextField! = UITextField()
    
    override func viewDidLoad() {
        answerVC = PatientVillage(userObject: user)
        backVC = PatientWeight(userObject: user)
        super.viewDidLoad()
        self.title = "Patient Height"
        errorMsg = "Please enter a valid number for patient Height"
        self.navigationController?.navigationBarHidden = false
        
        
        //OK Button
        let btn = UIButton()
        btn.styleForApp("OK")
        btn.addTarget(self, action: "answerButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        
        //Text with Dashed Line
        let viewHolder: UIView! = UIView()
        self.view.addSubview(viewHolder)
        fld.placeholder = "Enter Height"
        fld.keyboardType = UIKeyboardType.DecimalPad //TODO :: Improve this to be just the numbers & decimal.
        drawDashedLineWithTextField(viewHolder, fld: fld)
        
        //Weight Label
        let weightLabel: UILabel! = UILabel()
        weightLabel.text = "cm"
        weightLabel.font = UIFont(name: "Helvetica", size: self.view.frame.height * 0.08)
        weightLabel.textAlignment = NSTextAlignment.Center
        
        let spacer: UIView! = UIView(); self.view.addSubview(spacer); self.view.addSubview(weightLabel)
        buildConstraints(btn, obj2: viewHolder, obj3: weightLabel, spacer: spacer)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        fld.becomeFirstResponder()
    }
    
    //Submit patient weight
    override func answerButtonPressed(sender: UIButton) {
        saveAttribute(fld.text!)
        navigationController?.pushViewController(answerVC, animated: false)
    }
    
}


//MARK :: Constraints
extension PatientHeight {
    func buildConstraints(obj1: UIButton, obj2: UIView, obj3: UILabel, spacer: UIView){
        let ok = obj1
        let txtView = obj2
        let lbl = obj3
        let spacerHeight: CGFloat = self.view.frame.height * 0.18
        
        ok.translatesAutoresizingMaskIntoConstraints = false
        lbl.translatesAutoresizingMaskIntoConstraints = false
        txtView.translatesAutoresizingMaskIntoConstraints = false
        spacer.translatesAutoresizingMaskIntoConstraints = false
        
        let spacerSize = NSLayoutConstraint(item: spacer, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute:NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: spacerHeight)
        let fldBtnHeight = NSLayoutConstraint(item: ok, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: self.view.frame.height * 0.15)
        let BtnWidth = NSLayoutConstraint(item: ok, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: self.view.frame.height * 0.25)
        let lblWidth = NSLayoutConstraint(item: lbl, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: self.view.frame.height * 0.15)
        
        let topMargin = NSLayoutConstraint(item: spacer, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.topLayoutGuide, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let topOk = NSLayoutConstraint(item: ok, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: spacer, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let leftAlignment = NSLayoutConstraint(item: txtView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1, constant: 40)
        let rightAlignment = NSLayoutConstraint(item: self.view , attribute: NSLayoutAttribute.TrailingMargin, relatedBy: NSLayoutRelation.Equal, toItem: ok, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 40)
        let equalTopAlignment = NSLayoutConstraint(item: ok, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: txtView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        let equalBottomAlignment = NSLayoutConstraint(item: ok, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: txtView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let equalLabelTopAlignment = NSLayoutConstraint(item: ok, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: lbl, attribute: NSLayoutAttribute.Top, multiplier: 1, constant:
            -20)
        let equalLabelBottomAlignment = NSLayoutConstraint(item: ok, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: lbl, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let middleMarginTxtLblView = NSLayoutConstraint(item: txtView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: lbl, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 20)
        let middleMarginLblOkView = NSLayoutConstraint(item: lbl, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: ok, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        
        //With a fixed height (based off penis penis of frame height), and a fixed width of button (based off of frame height), then these constraints should work fine.
        
        NSLayoutConstraint.activateConstraints([topMargin, topOk, leftAlignment, rightAlignment, equalTopAlignment, equalBottomAlignment, spacerSize, fldBtnHeight, BtnWidth, middleMarginTxtLblView, middleMarginLblOkView, equalLabelTopAlignment, equalLabelBottomAlignment, lblWidth])
        
        
        
    }
}
