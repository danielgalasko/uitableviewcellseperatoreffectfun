# UITableViewCellSeperatorEffectFun

How to use the UITableView seperator effect with vibrancy to help make your cell separators pop like in iOS Notification Center

To get this working you need to set a UIVisualEffectView as your table's background view. Then you set the seperatorEffect on the tableView to use the same effect as the background:

    let blurredBackgroundView = TableViewBlurredBackgroundView(frame: CGRectZero)
    let seperatorEffect = UIVibrancyEffect(forBlurEffect: blurredBackgroundView.blurView.effect)
    tableView.separatorEffect = seperatorEffect

![Screenshot](screenshot.png "Vibrant Seperators")
