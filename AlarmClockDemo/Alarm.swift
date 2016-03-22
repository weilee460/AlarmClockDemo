//
//  Alarm.swift
//  AlarmClockDemo
//
//  Created by ying on 16/3/22.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit
import CoreLocation
import MediaPlayer

class Alarm: NSObject {
    //MARK: - Properties
    var name: String
    var location: CLCircularRegion
    var media: MPMediaItem
    
    //MARK: - Initialization
    init(name: String, location: CLCircularRegion, media: MPMediaItem) {
        self.name = name
        self.location = location
        self.media = media
    }
    
}