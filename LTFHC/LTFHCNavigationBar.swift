//
//  LTFHCNavigationBar.swift
//  LTFHC
//
//  Created by Carson Potter on 11/5/15.
//  Copyright © 2015 CPot. All rights reserved.
//

import UIKit

class LTFHCNavigationBar: UINavigationBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppColor
        self.tintColor = UIColor.whiteColor()
        self.barStyle = UIBarStyle.BlackOpaque
        self.sizeThatFits(CGSizeMake(self.frame.size.width, barHeight))
        self.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Helvetica", size:45)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.setTitleVerticalPositionAdjustment(-10
            , forBarMetrics: .Default)
        
        //Remove nav bar border and shadow image that changes color of bar from pure RGBA
        self.setBackgroundImage(UIImage(), forBarPosition: .Any, barMetrics: .Default)
        self.shadowImage = UIImage()
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for view: UIView in self.subviews {
            var frame = view.frame
            let viewOffset: CGFloat = frame.size.height/2
            frame.origin.y = self.frame.size.height/2 - viewOffset //+10
            view.frame = frame
        }
    }
    
    override func sizeThatFits(size: CGSize) -> CGSize {
        if let view = self.superview {
            return CGSize(width: view.bounds.size.width, height: barHeight)
        } else {
            return CGSize(width: 1024, height: barHeight)
        }
    }
    
}
