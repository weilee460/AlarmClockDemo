//
//  AlarmViewController.swift
//  AlarmClockDemo
//
//  Created by ying on 16/3/23.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit
import MediaPlayer

class AlarmViewController: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer()
    var alarm:Alarm!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = alarm.name
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        playMedia(alarm.media)
    }
    
    func playMedia(media:MPMediaItem) {
        
        let array = [media]
        let collection = MPMediaItemCollection(items: array)
        
        musicPlayer.setQueueWithItemCollection(collection)
        musicPlayer.play();
        
        
    }
    
    @IBAction func shutup(sender : AnyObject) {
        
        musicPlayer.stop()
        //navigationController!.presentingViewController?.dismissModalViewControllerAnimated(true)
        navigationController!.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    



}
