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
    
    var delegate: MapViewControllerDelegate? = nil

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var targetView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        targetView.layer.cornerRadius = 40.0
    }
    

    @IBAction func saveLocation(sender: UIBarButtonItem) {
        
        //save
        if ( delegate  != nil ) {
            
            let center = mapView.centerCoordinate
            
            let targetViewRegion = mapView.convertRect(targetView.bounds, toRegionFromView: targetView)
            
            //every degree of latitude delta corresponds to 110km
            let radius = targetViewRegion.span.latitudeDelta  * 110 * 1000
            
            //create a unique UUID
            let uuid = NSUUID().UUIDString
            
            let region = CLCircularRegion(center: center, radius: radius, identifier: uuid)
            self.delegate!.returnedRegion(region)
        }
        
    }

}
