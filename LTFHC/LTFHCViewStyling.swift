//
//  LTFHCViewStyling.swift
//  LTFHC
//
//  Created by Carson Potter on 11/10/15.
//  Copyright © 2015 CPot. All rights reserved.
//

import UIKit

//MARK :: Styling
extension LTFHCViewController{
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func drawDashedLineWithTextField(viewHolder: UIView, fld: UITextField) {
        
        
        //Configure text parameters
        fld.textAlignment = NSTextAlignment.Left
        fld.autocorrectionType = UITextAutocorrectionType.No
        fld.font = UIFont(name: "Helvetica", size: self.view.frame.height * 0.059)
        fld.borderStyle = UITextBorderStyle.None
        
        //Create Line
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(0, 0))
        path.addLineToPoint(CGPointMake(self.view.frame.height - (self.view.frame.height*0.25+20+80), 0))
        //        path.addLineToPoint(CGPointMake(800, 0))
        path.lineWidth = 8
        let dashes: [CGFloat] = [ path.lineWidth * 2, path.lineWidth * 2]
        path.setLineDash(dashes, count: dashes.count, phase: 0)
        
        //Draw line in graphics context, capture it as image
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.view.frame.height - (self.view.frame.height*0.25+20+80), 8), false, 2)
        UIColor.blackColor().setStroke()
        path.stroke()
        let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        //add image to View
        let imgView = UIImageView(image: img)
        imgView.frame = CGRect(x: 0, y: 0, width: self.view.frame.height - (self.view.frame.height*0.25+20+80), height: 8)
        
        viewHolder.addSubview(imgView)
        viewHolder.addSubview(fld)
        
        //Constrain image and text field appropriately here
        imgView.translatesAutoresizingMaskIntoConstraints = false
        fld.translatesAutoresizingMaskIntoConstraints = false
        viewHolder.translatesAutoresizingMaskIntoConstraints = false
        
        let imgViewOnBottom = NSLayoutConstraint(item: imgView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: viewHolder, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let textFieldOnTopOfImageView = NSLayoutConstraint(item: fld, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: imgView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        let textFieldOnTop = NSLayoutConstraint(item: fld, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: viewHolder, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        let leftAlignment = NSLayoutConstraint(item: imgView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: viewHolder, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        let rightAlignment = NSLayoutConstraint(item: imgView , attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: viewHolder, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        let leftAlignment2 = NSLayoutConstraint(item: fld, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: viewHolder, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        let rightAlignment2 = NSLayoutConstraint(item: fld , attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: viewHolder, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([imgViewOnBottom, textFieldOnTopOfImageView, leftAlignment, leftAlignment2, rightAlignment, rightAlignment2, textFieldOnTop])
    }
    
}