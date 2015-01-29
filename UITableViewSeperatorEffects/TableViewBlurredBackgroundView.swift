//
//  TableViewBlurredBackgroundView.swift
//  UITableViewSeperatorEffects
//
//  Created by Daniel Galasko on 1/29/15.
//  Copyright (c) 2015 danielgalasko. All rights reserved.
//

import UIKit

class TableViewBlurredBackgroundView: UIView {
    let imageView: UIImageView
    let blurView: UIVisualEffectView
    
    override init(frame: CGRect) {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        let imageView = UIImageView(image: UIImage.gorgeousImage())
        imageView.frame = visualEffectView.frame
        imageView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        let resizingMasks = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        let backView = UIView(frame: frame)
        backView.backgroundColor = UIColor.clearColor()
        backView.autoresizingMask = resizingMasks
        
        visualEffectView.autoresizingMask = resizingMasks
        backView.addSubview(imageView)
        backView.addSubview(visualEffectView)
        self.imageView = imageView
        self.blurView = visualEffectView
        super.init(frame: frame)
                self.addSubview(imageView)
        self.addSubview(self.blurView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        blurView.frame = bounds
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImage {
    class func gorgeousImage() -> UIImage {
        return UIImage(named: "gorgeousimage")!
    }
}