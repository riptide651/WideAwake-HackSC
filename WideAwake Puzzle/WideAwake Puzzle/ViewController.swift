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

    var motionManager: CMMotionManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        }
        
    
    @IBAction func startTracking(sender: AnyObject) {
        motionManager = CMMotionManager()
        if motionManager.accelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.01
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { accelerometerData, error in
                
                if let currAccel = accelerometerData {
                    var currSpeed: Double
                    currSpeed = sqrt(currAccel.acceleration.x*currAccel.acceleration.x + currAccel.acceleration.y*currAccel.acceleration.y)
                    
                    self.speedLabel.text = "CURRENT SPEED: " + String(0) + String(Int(currSpeed*1.7))
                }
                
                
            })
            
            
        }
    }

    @IBAction func stopTracking(sender: AnyObject) {
        motionManager.stopAccelerometerUpdates()
        self.speedLabel.text = "CURRENT SPEED: " + String(0) + String(0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //4B5F6D
    }
}




