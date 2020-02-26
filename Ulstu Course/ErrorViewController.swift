//
//  ErrorViewController.swift
//  Ulstu Course
//
//  Created by Antol Peshkov on 25/02/2020.
//  Copyright © 2020 Mad Brains. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backButtonTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
