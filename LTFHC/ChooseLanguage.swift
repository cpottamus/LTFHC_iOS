
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
        self.title = "Choose Language"
        
        
        
        let eng = UIButton()
        eng.styleForApp("English")
        eng.titleLabel!.font = UIFont(name: "Helvetica", size: 80)
        eng.addTarget(self, action: "answerButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(eng)
        
        let swa = UIButton()
        swa.styleForApp("Swahili")
        swa.titleLabel!.font = UIFont(name: "Helvetica", size: 80)
        swa.addTarget(self, action: "answerButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(swa)
        
        //Add spacers
        let spacer = UIView(); let spacer2 = UIView(); let spacer3 = UIView(); self.view.addSubview(spacer); self.view.addSubview(spacer2); self.view.addSubview(spacer3);
        
        //Add constraints
        buildConstraints(eng, obj2: swa, spacer: spacer, spacer2: spacer2, spacer3: spacer3)
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    
    override func answerButtonPressed(sender: UIButton) {
        language = sender.titleLabel!.text!
        navigationController?.pushViewController(answerVC, animated: false)
    }
    
}


//MARK :: Constraints
extension ChooseLanguage {
    func buildConstraints(obj1: UIButton, obj2: UIButton, spacer: UIView, spacer2: UIView, spacer3: UIView){
        let eng = obj1 
        let swa = obj2
        let spacerHeight: CGFloat = self.view.frame.height * 0.11
        
        eng.translatesAutoresizingMaskIntoConstraints = false
        swa.translatesAutoresizingMaskIntoConstraints = false
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer2.translatesAutoresizingMaskIntoConstraints = false
        spacer3.translatesAutoresizingMaskIntoConstraints = false
        
        let spacerSize = NSLayoutConstraint(item: spacer, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute:NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: spacerHeight)
        let spacer2Size = NSLayoutConstraint(item: spacer2, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute:NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: spacerHeight)
        let spacer3Size = NSLayoutConstraint(item: spacer3, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute:NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: spacerHeight)
        
        let topMargin = NSLayoutConstraint(item: spacer, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.topLayoutGuide, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let topEng = NSLayoutConstraint(item: eng, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: spacer, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let topSpacer2 = NSLayoutConstraint(item: spacer2, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: eng, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let topSwa = NSLayoutConstraint(item: swa, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: spacer2, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let topSpacer3 = NSLayoutConstraint(item: spacer3, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: swa, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let bottomMargin = NSLayoutConstraint(item: self.bottomLayoutGuide, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: spacer3, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        let leftAlignment = NSLayoutConstraint(item: eng, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1, constant: 20)
        let rightAlignment = NSLayoutConstraint(item: self.view , attribute: NSLayoutAttribute.TrailingMargin, relatedBy: NSLayoutRelation.Equal, toItem: eng, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 20)
        let equalLeftAlignment = NSLayoutConstraint(item: eng, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: swa, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        let sameHeight = NSLayoutConstraint(item: eng, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: swa, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        let equalRightAlignment = NSLayoutConstraint(item: eng, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: swa, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([leftAlignment, equalLeftAlignment, sameHeight, equalRightAlignment, rightAlignment, spacerSize, spacer2Size, spacer3Size, topMargin, topEng, topSpacer2, topSwa, topSpacer3, bottomMargin])
        
        
        
    }
}