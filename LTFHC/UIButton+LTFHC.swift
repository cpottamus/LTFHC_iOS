//
//  UIButton+LTFHC.swift
//  LTFHC
//
//  Created by Carson Potter on 10/20/15.
//  Copyright © 2015 CPot. All rights reserved.
//


/*================================================================================================

A simple class here that is the standard interface button.

================================================================================================*/

import UIKit

extension UIButton {
    func styleForApp(value: String){
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.setTitle(value, forState: .Normal)
        self.backgroundColor = AppColor
        self.layer.cornerRadius = 20
        self.titleLabel!.font = UIFont(name: "Helvetica", size: 35)
        
        self.titleLabel!.adjustsFontSizeToFitWidth = true
    }
    
//    func LTFHCBarButton(imgStr: String, selectorStr: Selector) -> UIBarButtonItem {
//        self.setImage(UIImage(named: imgStr), forState: UIControlState.Normal)
//        self.addTarget(self, action: selectorStr, forControlEvents: UIControlEvents.TouchUpInside)
//        self.frame = CGRectMake(0, 0, 100, 58)
//        
//        return UIBarButtonItem(customView: self)
//        
//        
//    }
    
}
