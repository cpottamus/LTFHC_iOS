//
//  SelectVillage.swift
//  LTFHC
//
//  Created by Carson Potter on 10/21/15.
//  Copyright © 2015 CPot. All rights reserved.
//

import UIKit


class OtherTest: LTFHCViewController {
    
    override func viewDidLoad() {
        answerVC = TestResult(userObject: user)
        backVC = TestDone(userObject: user)
        super.viewDidLoad()
        self.title = "Test Done"
    
        
    let btn = UIButton()
    btn.styleForApp("Text here")
    btn.addTarget(self, action: "answerButtonPressed:", forControlEvents: .TouchUpInside)
    btn.frame = CGRectMake(150, 44, 60, 60)
    self.view.addSubview(btn)
        
    }
    
}

