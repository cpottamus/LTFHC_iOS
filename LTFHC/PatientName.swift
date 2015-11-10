//
//  SelectVillage.swift
//  LTFHC
//
//  Created by Carson Potter on 10/21/15.
//  Copyright © 2015 CPot. All rights reserved.
//

import UIKit


class PatientName: LTFHCViewController {
    
    var textField: UITextField! = UITextField()
    
    override func viewDidLoad() {
        answerVC = ChooseGender()
        backVC = Menu()
        super.viewDidLoad()
        self.title = "Patient Name"
        
        
        
        //OK Button
        let btn = UIButton()
        btn.styleForApp("OK")
        btn.addTarget(self, action: "answerButtonPressed:", forControlEvents: .TouchUpInside)
        btn.frame = CGRectMake(774, 258, 152, 88)
        self.view.addSubview(btn)
        
        drawDashedLineWithTextField(textField, txtWidth: 580, txtX: 145, lineWidth: 590, lineX: 135)
        self.view.addSubview(textField)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
        
    }
    
    //Submit patient name
    override func answerButtonPressed(sender: UIButton) {
        //get the text information here
        print("Pressed")
        print(textField.text!)
        
    }
    
}

