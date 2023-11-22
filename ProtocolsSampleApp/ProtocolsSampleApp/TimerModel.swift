//
//  TimerModel.swift
//  ProtocolImplementation
//
//  Created by Priya Gandhi on 2023-11-22.
//

import UIKit

      protocol TimerData {
        var countDownTime : Int {get}
    }

protocol TimerFunc : TimerData{
    func timeString(time: TimeInterval)  -> String
}

struct TimerImplementaton: TimerFunc{
    var countDownTime: Int = 0
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    

    
   
    
    
}
