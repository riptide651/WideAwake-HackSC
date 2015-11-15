//
//  ViewController.swift
//  WideAwake Puzzle
//
//  Created by Apple on 11/14/15.
//  Copyright © 2015 Mark Yampolsky. All rights reserved.
//

import UIKit
import CoreMotion
import AudioToolbox


class ViewController: UIViewController {
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var trackButton: UIButton!

    var motionManager: CMMotionActivityManager!
    var goalMet: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        goalMet = false
        
        }
        
    
    @IBAction func startTracking(sender: AnyObject) {
        motionManager = CMMotionActivityManager()
        
        if(CMMotionActivityManager.isActivityAvailable() && goalMet == false){
            motionManager.startActivityUpdatesToQueue(NSOperationQueue.mainQueue()) { activity in
                if (activity!.stationary == true) {
                    self.speedLabel.text = "BUST A MOVE"
                } else if (activity!.walking == true) {
                    self.speedLabel.text = "DANCE GOAL MET"
                    self.goalMet = true
                    
                    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
                    let timer: NSTimer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("segue:"), userInfo: nil, repeats: false)
                    
                }
            }
        }

}

    @IBAction func stopTracking(sender: AnyObject) {
        motionManager.stopActivityUpdates()
        if (goalMet == false) {
            self.speedLabel.text = "BUST A MOVE"
        }
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



