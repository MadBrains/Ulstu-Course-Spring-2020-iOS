//
//  ViewController.swift
//  Ulstu Course
//
//  Created by Antol Peshkov on 17/02/2020.
//  Copyright © 2020 Mad Brains. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let registeredUserEmail = "test@test.ru"
    let registeredUserPass = "qwerty"
    
    @IBOutlet weak var registeredLabel: UILabel!
    @IBOutlet weak var registeredSwitch: UISwitch!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var passRepeatTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    @IBAction func changeValueSwitch(_ sender: Any) {
        updateSwitchState()
    }
    
    @IBAction func tapActionButton(_ sender: Any) {
        if registeredSwitch.isOn {
            if emailTextField.text! == registeredUserEmail &&
                passTextField.text! == registeredUserPass
            {
                showAlert(withMessage: "Добро пожаловать \(emailTextField.text!)")
            }
            else {
                showAlert(withMessage: "Неправильный логин или пароль")
            }
        }
        else {
            if passTextField.text! == passRepeatTextField.text! {
                showAlert(withMessage: "Добро пожаловать \(emailTextField.text!)")
            }
            else {
                showAlert(withMessage: "Пароли не совпадают")
            }
        }
    }
    
    @IBAction func tapOnView(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passTextField.delegate = self
        passRepeatTextField.delegate = self
        
        updateSwitchState()
        updateButtonState()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateButtonState()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        updateButtonState()
        return true
    }
    
    private func updateSwitchState() {
        if registeredSwitch.isOn {
            passRepeatTextField.isHidden = true
            actionButton.setTitle("Авторизация", for: .normal)
        } else {
            passRepeatTextField.isHidden = false
            actionButton.setTitle("Регистрация", for: .normal)
        }
        
        updateButtonState()
    }
    
    private func updateButtonState() {
        if registeredSwitch.isOn {
            if emailTextField.text!.isEmpty ||
                passTextField.text!.isEmpty
            {
                actionButton.isEnabled = false
            }
            else {
                actionButton.isEnabled = true
            }
        }
        else {
            if emailTextField.text!.isEmpty ||
                passTextField.text!.isEmpty ||
                passRepeatTextField.text!.isEmpty
            {
                actionButton.isEnabled = false
            }
            else {
                actionButton.isEnabled = true
            }
        }
    }
    
    private func showAlert(withMessage: String) {
        let alert = UIAlertController(title: withMessage, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ладно", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

