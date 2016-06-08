//
//  GameViewController.swift
//  barabara
//
//  Created by 福島達也 on 2016/06/08.
//  Copyright © 2016年 福島達也. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    @IBOutlet var imgView3: UIImageView!
    
    @IBOutlet var resultLabel: UILabel!
    
    var timer: NSTimer!
    var score: Int = 1000
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    let width:CGFloat = UIScreen.mainScreen().bounds.size.width
    var positionX:[CGFloat]=[0.0,0.0,0.0]
    var dx:[CGFloat]=[1.0,0.5,-1.0]
    
    func start(){
        resultLabel.hidden = true
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.005,target:self,selector:"up",userInfo:nil,repeats: true)
        timer.fire()
    }
    
    func up(){
        for i in 0..<3{
            if positionX[i] > width || positionX[i] < 0{
                dx[i] = dx[i]*(-1)
            }
            positionX[i] += dx[i]
        }
        imgView1.center.x = positionX[0]
        imgView2.center.x = positionX[1]
        imgView3.center.x = positionX[2]
    }
    @IBAction func stop(){
        if timer.valid == true{
            timer.invalidate()
        }
            for i in 0..<3{
                score = score - abs(Int(width/2 - positionX[i]))*2
        }
            resultLabel.text = "Score:" + String(score)
            resultLabel.hidden = false
        }
    @IBAction func retry(){
        score = 1000
        positionX = [width/2,width/2,width/2]
        self.start()
        
    }
    
    override func viewDidLoad() {
            positionX = [width/2,width/2,width/2]
            
            self.start()
        }
    
    @IBAction func modoru(){
        self.dismissViewControllerAnimated(true,completion:nil)
    }
        // Do any additional setup after loading the view

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

