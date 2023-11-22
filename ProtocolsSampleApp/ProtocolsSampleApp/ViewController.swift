//
//  ViewController.swift
//  ProtocolImplementation
//
//  Created by Priya Gandhi on 2023-11-22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var btnPlayPause: UIButton!
    var countDownTimer : Timer!
    var timeObj = TimerImplementaton()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
     func startTimer() {
         countDownTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
        
    @objc func updateTime(){
        timeObj.countDownTime += 1
        self.lblTimer.text = timeObj.timeString(time: TimeInterval(timeObj.countDownTime))
    }
    
    //MARK- UIButton Action
    @IBAction func playPauseAction(sender: UIButton){
        startTimer()
        
    }


}


