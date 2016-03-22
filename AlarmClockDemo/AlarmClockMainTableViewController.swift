//
//  AlarmClockMainTableViewController.swift
//  AlarmClockDemo
//
//  Created by ying on 16/3/22.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class AlarmClockMainTableViewController: UITableViewController {
    
    var objects: [Alarm] = []
    
    struct AlarmClockAppUseIdentifier {
        static let clockCellIdentifier = "clockCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(AlarmClockAppUseIdentifier.clockCellIdentifier, forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        let object = objects[indexPath.row] as Alarm
        cell.textLabel!.text = object.name

        return cell
    }
 

}
