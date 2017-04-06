//
//  ViewController.swift
//  DelegateSample
//
//  Created by Hung Chang Lo on 06/04/2017.
//  Copyright © 2017 Go-Trust. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TouchButtonProtocol {
    var button: TouchButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Init Touch Button */
        button = TouchButton(frame: CGRect(x: self.view.frame.maxX/2 - 75, y: self.view.frame.maxY/2 - 50, width: 150, height: 100))
        
        // Set TouchButton background
        button.backgroundColor = UIColor.lightGray
        
        // Register delegate to self
        button.delegate = self
        button.dataSource = self
        
        // Add Touch button to self view
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTapButton(touchButton: TouchButton) {
        NSLog("INFO: Touch button is touched")
        touchButton.setTxtOnTouchButton()
    }
    
    func txtOnTouchButton() -> String {
        return "Hello Protocol"
    }
}

