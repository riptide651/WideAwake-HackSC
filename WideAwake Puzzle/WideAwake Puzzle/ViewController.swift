//
//  ViewController.swift
//  WideAwake Puzzle
//
//  Created by Apple on 11/14/15.
//  Copyright © 2015 Mark Yampolsky. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var trackButton: UIButton!

    var motionManager: CMMotionActivityManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        }
        
    
    @IBAction func startTracking(sender: AnyObject) {
        motionManager = CMMotionActivityManager()
        
        if(CMMotionActivityManager.isActivityAvailable()){
            motionManager.startActivityUpdatesToQueue(NSOperationQueue.mainQueue()) { activity in
                if (activity!.stationary == true) {
                    self.speedLabel.text = "BUST A MOVE"
                } else if (activity!.walking == true) {
                    self.speedLabel.text = "DANCE GOAL MET"
                    
                    let timer: NSTimer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("segue:"), userInfo: nil, repeats: false)
                    
                }
            }
        }

}

    @IBAction func stopTracking(sender: AnyObject) {
        motionManager.stopActivityUpdates()
        self.speedLabel.text = "BUST A MOVE"
        
    }
    
    func segue(timer : NSTimer) {
        //segue code
        print("Timer fired")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //4B5F6D
    }
}




//Stuff



