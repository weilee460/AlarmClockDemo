//
//  AddAlarmClockTableViewController.swift
//  AlarmClockDemo
//
//  Created by ying on 16/3/23.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit
import MediaPlayer
import CoreLocation

class AddAlarmClockTableViewController: UITableViewController,MPMediaPickerControllerDelegate, MapViewControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mapCell: UITableViewCell!
    @IBOutlet weak var mapCellLabel: UILabel!
    
    
    @IBOutlet weak var mediaCell: UITableViewCell!
    @IBOutlet weak var mediaImageView: UIImageView!
    
    var mediaItem:MPMediaItem?
    var region:CLCircularRegion?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Action
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        navigationController?.presentingViewController?.dismissViewControllerAnimated(true, completion: {});
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        
        if ( region == nil || mediaItem == nil || nameTextField.text!.isEmpty ) {
            //validation failed
            return
        }
        
        
        var alarm = Alarm(name: nameTextField.text!, location: region!, media: mediaItem!)
        
        
        navigationController!.presentingViewController?.dismissViewControllerAnimated(true, completion: {
            
            let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.addAlarm(alarm)
            
        });
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if ( cell == mediaCell ) {
            
            let mediaPicker = MPMediaPickerController(mediaTypes: .Music)
            mediaPicker.delegate = self
            mediaPicker.prompt = "Select any song!"
            mediaPicker.allowsPickingMultipleItems = false
            presentViewController(mediaPicker, animated: true, completion: {})
            
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        
        if ( segue!.identifier == "map" ) {
            var mapVC = segue!.destinationViewController as! LocationViewController
            mapVC.delegate = self
        }
    }

    
    func returnedRegion(region: CLCircularRegion) {
        
        
        self.region = region
        mapCellLabel.text = "Region Selected"
        self.navigationController!.popViewControllerAnimated(true)
    }


}
