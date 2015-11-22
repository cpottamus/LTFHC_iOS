//
//  SelectVillage.swift
//  LTFHC
//
//  Created by Carson Potter on 10/21/15.
//  Copyright © 2015 CPot. All rights reserved.
//

import UIKit


class PatientVillage: LTFHCViewController {
    
    override func viewDidLoad() {
        answerVC = TestDone(userObject: user)
        backVC = PatientHeight(userObject: user)
        super.viewDidLoad()
        self.title = "Patient Village"
        
        
        let btn = UIButton()
        btn.styleForApp("Kapili")
        btn.addTarget(self, action: "answerButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        
        let btn2 = UIButton()
        btn2.styleForApp("Kigoma")
        btn2.addTarget(self, action: "answerButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn2)
        
        let btn3 = UIButton()
        btn3.styleForApp("Kirando")
        btn3.addTarget(self, action: "answerButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn3)
        
        let btn4 = UIButton()
        btn4.styleForApp("Other")
        btn4.addTarget(self, action: "answerButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn4)
        
        buildConstraints(btn, btn2: btn2, btn3: btn3, btn4: btn4)
        
    }
    
    
}

//Mark :: Constraints
extension PatientVillage {
    
    func buildConstraints(btn: UIButton, btn2: UIButton, btn3: UIButton, btn4: UIButton) {
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn2.translatesAutoresizingMaskIntoConstraints = false
        btn3.translatesAutoresizingMaskIntoConstraints = false
        btn4.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
    }
    
}

