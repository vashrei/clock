//
//  ViewController.swift
//  clock_2
//
//  Created by 古屋歩純 on 2014/06/09.
//  Copyright (c) 2014年 古屋歩純. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var hourFirstImageView: UIImageView
    @IBOutlet var hourSecondImagView: UIImageView
    @IBOutlet var minuteFirstImageView: UIImageView
    @IBOutlet var minuteSecondImageView: UIImageView
    @IBOutlet var secondFirstImageView: UIImageView
    @IBOutlet var secondSecondImageView: UIImageView
    @IBOutlet var backgroundImageView: UIImageView
    
    var calendar = NSCalendar.currentCalendar()
    var component = NSDateComponents()
    let flag: NSCalendarUnit = .HourCalendarUnit | .MinuteCalendarUnit | .SecondCalendarUnit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        component = calendar.components(flag, fromDate:(NSDate.date()))
        
        hourFirstImageView.image = UIImage(named: String(component.hour/10))
        hourSecondImagView.image = UIImage(named: String(component.hour%10))
        minuteFirstImageView.image = UIImage(named: String(component.minute/10))
        minuteSecondImageView.image = UIImage(named: String(component.minute%10))
        secondFirstImageView.image = UIImage(named: String(component.second/10))
        secondSecondImageView.image = UIImage(named: String(component.second%10))
    }
}
