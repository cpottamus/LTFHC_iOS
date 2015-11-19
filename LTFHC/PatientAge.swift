//
//  SelectVillage.swift
//  LTFHC
//
//  Created by Carson Potter on 10/21/15.
//  Copyright © 2015 CPot. All rights reserved.
//

import UIKit
import CoreData

class PatientAge: LTFHCViewController {
    
    override func viewDidLoad() {
        backVC = ChooseGender(userObject: user)
        answerVC = PatientWeight(userObject: user)
        super.viewDidLoad()
        self.title = "Patient Age"
        
        let btn = UIButton()
        btn.styleForApp("Text here")
        btn.addTarget(self, action: "test", forControlEvents: .TouchUpInside)
        btn.frame = CGRectMake(250, 344, 60, 60)
        self.view.addSubview(btn)
        
    }
    
    
    func test() {
        let request = NSFetchRequest(entityName: "Register")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try DataStore.instance.privateContext.executeFetchRequest(request)
            
            if results.count > 0 {
                
                for result: AnyObject in results {
                    print(result)
                }
            }
        } catch {
            print("Error")
        }
        
    }
    
}

