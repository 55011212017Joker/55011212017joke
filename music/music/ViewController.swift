//
//  ViewController.swift
//  music
//
//  Created by Student on 11/21/14.
//  Copyright (c) 2014 jay. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class ViewController: UIViewController {
    //core Audio
    var audioPlayer1 = AVAudioPlayer()
    var audioPlayer2 = AVAudioPlayer()
    var audioPlayer3 = AVAudioPlayer()
    //Core Motion
    let motionManager = CMMotionManager()
    let motionQueue = NSOperationQueue()
    
    

    override func viewDidLoad() {
        coreAudio1()
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //createMap();
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    //////////

    @IBAction func UIButton1(sender: AnyObject) {
      audioPlayer1.pause()
        
    }
    
    
    

    @IBAction func UIButton2(sender: AnyObject) {
        
         audioPlayer1.play()
    }
    
    
    
    @IBAction func UIButton3(sender: AnyObject) {
        audioPlayer1.stop()
    }
    
    func coreAudio1(){
        var url1  = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("1", ofType: "mp3")!)
        
        var error:NSError?
        audioPlayer1 = AVAudioPlayer(contentsOfURL: url1, error:&error)
        audioPlayer1.prepareToPlay()
        
        
        
        
    }
    func coreAudio2(){
        var url2  = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("2", ofType: "mp3")!)
        
        var error:NSError?
        audioPlayer2 = AVAudioPlayer(contentsOfURL: url2, error:&error)
        audioPlayer2.prepareToPlay()
        
        
        
        
    }
    func coreAudio3(){
        var url3  = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("3", ofType: "mp3")!)
        
        var error:NSError?
        audioPlayer3 = AVAudioPlayer(contentsOfURL: url3, error:&error)
        audioPlayer3.prepareToPlay()
        
        
        
        
    }
    /////////////Core motion
    func coreMotion(){
        
        motionManager.startDeviceMotionUpdatesToQueue(motionQueue, withHandler: motion,error in
        
            if error != nil{
                println("Error: \(error.localizedDescription)")
            return
            }
        let g: CMAcceleration = motion.gravity
        
        let x = CGFloat(g.x)
        let y = CGFloat(g.y)
        var p = CGPoint(x:x,y:y)
        var orientation = UIApplication.sharedApplication().statusBarOrientation
        
        switch orientation {
        case .LandscapeLeft:
            var t = p.x
            p.x = 0.0 * p.y
            p.y = t
        case .LandscapeRight:
            var t = p.x
            p.x = p.y
            p.y = 0.0 - true
        case .Portrait:
            p.x *= 1.0
            p.y *= 1.0
        case .PortraitUpsideDown:
            p.x *= -1.0
            p.y *= -1.0
        default:
            break
            
        }
        self.gravity.gravityDirection = CGVec
        
        )
    }
    
    
    
    
    
}

