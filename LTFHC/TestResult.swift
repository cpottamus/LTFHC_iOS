//
//  SelectVillage.swift
//  LTFHC
//
//  Created by Carson Potter on 10/21/15.
//  Copyright © 2015 CPot. All rights reserved.
//

import UIKit


class TestResult: LTFHCViewController {
    
    override func viewDidLoad() {
        answerVC = ChooseLanguage(userObject: user)
        backVC = TestDone(userObject: user)
        super.viewDidLoad()
        self.title = "Test Result"
        
    let btn = UIButton()
    btn.styleForApp("Text here")
    btn.addTarget(self, action: "answerButtonPressed:", forControlEvents: .TouchUpInside)
    btn.frame = CGRectMake(150, 44, 60, 60)
    self.view.addSubview(btn)
        
    }
    
}

