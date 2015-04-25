//
//  ViewController.swift
//  UITableViewSeperatorEffects
//
//  Created by Daniel Galasko on 1/29/15.
//  Copyright (c) 2015 danielgalasko. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    let effect = UIBlurEffect(style: .Dark)
    let resizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundView = UIView(frame: view.bounds)
        backgroundView.autoresizingMask = resizingMask
        backgroundView.addSubview(self.buildImageView())
        backgroundView.addSubview(self.buildBlurView())
        
        tableView.backgroundView = backgroundView
        tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: effect)
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func buildImageView() -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: "gorgeousimage"))
        imageView.frame = view.bounds
        imageView.autoresizingMask = resizingMask
        return imageView
    }
    
    func buildBlurView() -> UIVisualEffectView {
        let blurView = UIVisualEffectView(effect: effect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = resizingMask
        return blurView
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as! UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        if indexPath.row == 1 {
            cell.textLabel?.text = "Doesn't this look gorgeous"
            cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 26)
            cell.textLabel?.textColor = UIColor.whiteColor()
        }
        return cell
    }
}

