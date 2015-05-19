//
//  ViewController.swift
//  UITableViewSeperatorEffects
//
//  Created by Daniel Galasko on 1/29/15.
//  Copyright (c) 2015 danielgalasko. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //This is all we need to achieve blurred separators
        let blurredBackgroundView = BlurredBackgroundView(frame: CGRectZero)
        tableView.backgroundView = blurredBackgroundView
        tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: blurredBackgroundView.blurView.effect as! UIBlurEffect)
    }
    
    //MARK: UITableViewDataSource
    var words: [String] = "Doesn't this look awesome".componentsSeparatedByString(" ")
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.text = words[indexPath.row]
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 26)
        cell.textLabel?.textAlignment = .Center
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
}

class BlurredBackgroundView: UIView {
    let imageView: UIImageView
    let blurView: UIVisualEffectView
    
    override init(frame: CGRect) {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        imageView = UIImageView(image: UIImage.gorgeousImage())
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(blurView)
    }
    
    convenience required init(coder aDecoder: NSCoder) {
        self.init(frame: CGRectZero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        blurView.frame = bounds
    }
}

extension UIImage {
    class func gorgeousImage() -> UIImage {
        return UIImage(named: "gorgeousimage")!
    }
}