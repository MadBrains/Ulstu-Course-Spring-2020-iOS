//
//  ViewController.swift
//  Ulstu Course
//
//  Created by Antol Peshkov on 17/02/2020.
//  Copyright © 2020 Mad Brains. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func buttonTap(_ sender: Any) {
        helloLabel.text = "Hello, World!"
    }

    @IBAction func chnageSliderValue(_ sender: UISlider) {
        print(volumeSlider.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("App started!")
        
        volumeSlider.value = 0
    }
}

