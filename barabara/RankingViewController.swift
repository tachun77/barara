//
//  RankingViewController.swift
//  barabara
//
//  Created by 福島達也 on 2016/06/08.
//  Copyright © 2016年 福島達也. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {
    
    @IBAction func modoru(){
        self.dismissViewControllerAnimated(true, completion : nil)
    }
    
    @IBOutlet var rankingLabel1: UILabel!
    @IBOutlet var rankingLabel2: UILabel!
    @IBOutlet var rankingLabel3: UILabel!
    
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        
        rankingLabel1.text = "1st:" + String(defaults.integerForKey("score1"))
        rankingLabel2.text = "2nd:" + String(defaults.integerForKey("score2"))
        rankingLabel3.text = "3rd:" + String(defaults.integerForKey("score3"))
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
