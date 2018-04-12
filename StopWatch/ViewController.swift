//
//  ViewController.swift
//  StopWatch
//
//  Created by D7703_22 on 2018. 4. 12..
//  Copyright © 2018년 D7703_22. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Start: UIButton!
    @IBOutlet weak var Stop: UIButton!
    @IBOutlet weak var Reset: UIButton!
    @IBOutlet weak var a: UILabel!
    
    var count = 0
    var myTimer = Timer()
    
    func changeButoonState(start: Bool, stop: Bool, reset: Bool ) {
        Start.isEnabled = start
        Stop.isEnabled = stop
        Reset.isEnabled = reset
        //작동하도록 하는게 isEnabled
        //작동안하도록 하는게 disEnabled
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateTime(){
        count = count + 1
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        a.text = String(format: "%02d:%02d:%02d", min, sec, msec)
        //이 코드는(format:) 라벨에 00:00:00 표시 되도록 한다.
    }
    
    @IBAction func Start(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: { (myTimer) in self.updateTime()
        })
        changeButoonState(start: false, stop: true, reset: true)
        //이 코드가 버튼을 클릭하면 더이상 눌러지지 않도록 지금은  start에 false로 해놨기 때문에 start만 더이상 눌러지지않음.
    }
    
    @IBAction func Stop(_ sender: Any) {
        myTimer.invalidate()
        changeButoonState(start:true, stop: false, reset: true)
    }
    
    @IBAction func Reset(_ sender: Any){
        a.text = ("00:00:00")
        count = 0
        changeButoonState(start: true, stop: true, reset: false)
    }
    

}
