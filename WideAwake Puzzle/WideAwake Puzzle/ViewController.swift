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
        
        var speedCount: Int
        speedCount = 0
        var speedTotal: Double
        speedTotal = 0
        var isStanding: Bool
        var isWalking: Bool
        isStanding = true
        isWalking = false
        //let isJogging = false
        
        if motionManager.accelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.05
            
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { accelerometerData, error in
                
                if let currAccel = accelerometerData {
                    var currSpeed: Double
                    //var speedCount: Int
                    
                    currSpeed = currAccel.acceleration.x//sqrt(currAccel.acceleration.x*currAccel.acceleration.x + currAccel.acceleration.y*currAccel.acceleration.y)
                    
                    speedCount = speedCount+1
                    speedTotal = speedTotal + currSpeed
                    
                    //var isStanding = 0.15
                    if (speedCount%20 == 0) {
                        currSpeed = speedTotal/20.0
                        speedTotal = 0
                        print(currSpeed)
                        if (currSpeed > 0.24 && isStanding == true) {
                            self.speedLabel.text = "CURRENTLY WALKING"
                            isStanding = false
                            isWalking = true
                        }
                        if (currSpeed < 0.10 && isWalking == true) {
                            self.speedLabel.text = "CURRENTLY STANDING"
                            isStanding = true
                            isWalking = false
                        }
                    }
                }
                
                
            })
            
            
        }
    }

    @IBAction func stopTracking(sender: AnyObject) {
        motionManager.stopAccelerometerUpdates()
        self.speedLabel.text = "CURRENTLY STANDING"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //4B5F6D
    }
}




