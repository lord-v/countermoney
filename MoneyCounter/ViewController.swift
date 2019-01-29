//
//  ViewController.swift
//  MoneyCounter
//
//  Created by mac on 1/20/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Labels
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!

    // Buttons
    @IBOutlet weak var startButton: UIButton!

    
    // Variables
    var time:  Int = 0
    var timer = Timer()
    
    // Function
    @IBAction func start(_ sender: Any) {
        startButton.isEnabled = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(_ sender: Any) {
        startButton.isEnabled = true
        timer.invalidate()
    }
    
    @IBAction func reset(_ sender: Any) {
        startButton.isEnabled = true
        timer.invalidate()
        time = 0
        timerLabel.text = "00:00:00"
        moneyLabel.text = "0.00$"
    }
    
    @objc func action() {
        time += 1
        OnTick()
        timerLabel.text = String().formatTime(time)
    }
    
    func OnTick()
    {
        moneyLabel.text = String().formatMoney(7, "$", time)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   override func viewWillAppear(_ animated: Bool) { // скоро загрузится view
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
   
    override func viewWillDisappear(_ animated: Bool) { // мы не видим появление view
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

