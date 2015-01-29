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
        let blurredBackgroundView = TableViewBlurredBackgroundView(frame: CGRectZero)
        blurredBackgroundView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        blurredBackgroundView.frame = self.tableView.bounds
        self.tableView.backgroundView = blurredBackgroundView
        self.tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: blurredBackgroundView.blurView.effect as UIBlurEffect)
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.text = "Doesn't this look gorgeous"
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 26)
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
}

