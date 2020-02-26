//
//  MainViewController.swift
//  Ulstu Course
//
//  Created by Antol Peshkov on 25/02/2020.
//  Copyright © 2020 Mad Brains. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var email: String?
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = email
    }

}
