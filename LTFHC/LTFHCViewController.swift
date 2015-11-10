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
    
    //ViewControllers for future answers
    var answerVC: UIViewController!
    var altAnswerVC: UIViewController!
    var backVC: UIViewController!
    //var nextVC:  UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Default"
        self.setNeedsStatusBarAppearanceUpdate()

        
        
        //Left Bar Button
        let btn: UIButton = UIButton(type: UIButtonType.Custom)
        btn.setImage(UIImage(named: "backArrow.png"), forState: UIControlState.Normal)
        btn.addTarget(self, action: "backButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        btn.frame = CGRectMake(0, 0, 100, 58)
        let lftBarBtn: UIBarButtonItem = UIBarButtonItem(customView: btn)
        navigationItem.leftBarButtonItem = lftBarBtn
        
        //Right Bar Button
        let btn2: UIButton = UIButton(type: UIButtonType.Custom)
        btn2.setImage(UIImage(named: "forwardArrow.png"), forState: UIControlState.Normal)
        btn2.addTarget(self, action: "nextButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        btn2.frame = CGRectMake(0, 0, 100, 58)
        let rghtBarBtn: UIBarButtonItem = UIBarButtonItem(customView: btn2)
        navigationItem.rightBarButtonItem = rghtBarBtn

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
    
//MARK :: Styling
extension LTFHCViewController{
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func drawDashedLineWithTextField(fld: UITextField, txtWidth: CGFloat, txtX: CGFloat, lineWidth: CGFloat, lineX: CGFloat) {
        
        //Add text field
        let frame = CGRectMake(txtX, 225, txtWidth, 140)
        fld.frame = frame
        fld.textAlignment = NSTextAlignment.Left
        fld.autocorrectionType = UITextAutocorrectionType.No
        fld.font = UIFont(name: "Helvetica", size: 45)
        fld.borderStyle = UITextBorderStyle.None
        
        //Create Line
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(0, 0))
        path.addLineToPoint(CGPointMake(lineWidth, 0))
        path.lineWidth = 8
        let dashes: [CGFloat] = [ path.lineWidth * 2, path.lineWidth * 2]
        path.setLineDash(dashes, count: dashes.count, phase: 0)
        
        //Draw line in graphics context, capture it as image
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(900, 400), false, 2)
        UIColor.blackColor().setStroke()
        path.stroke()
        let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //add image to View
        let imgView = UIImageView(image: img)
        imgView.frame = CGRect(x: lineX, y: 335, width: 925, height: 250)
        self.view.addSubview(imgView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

