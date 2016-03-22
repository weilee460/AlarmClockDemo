//
//  LocationViewController.swift
//  AlarmClockDemo
//
//  Created by ying on 16/3/22.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit
import MapKit
import QuartzCore

protocol MapViewControllerDelegate {
    
    func returnedRegion( region:CLCircularRegion )
    
}

class LocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
