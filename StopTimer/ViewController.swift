//
//  ViewController.swift
//  StopTimer
//
//  Created by Beata on 09/10/2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    
    var timer: Timer?
    var isStarted = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func updateTimerLabel() {
        counter += 0.1
        timerLabel.text = String(round(counter * 10)/10) // zaokrąglenie do dziesiętnych dzięki Foundation
    }

    @IBAction func startStopAction(_ sender: UIButton) {
        if isStarted {
            timer?.invalidate()
            isStarted = false
            startStopButton.setTitle("Start", for: .normal)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimerLabel), userInfo: nil, repeats: true)
                      isStarted = true
                      startStopButton.setTitle("Stop", for: .normal)
        }
        
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        counter = 0.0
        timerLabel.text = "0.0"
        if isStarted{
            timer?.invalidate()
            startStopButton.setTitle("Start", for: .normal)
            isStarted = false
        }
    }
}

