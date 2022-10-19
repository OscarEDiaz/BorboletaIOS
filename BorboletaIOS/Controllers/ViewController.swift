//
//  ViewController.swift
//  borboleta
//
//  Created by Oscar Ramírez Díaz on 25/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    
    let customizer = CustomButtonsInputs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Initializing custom buttons
        customizer.customInputField(inputField: userTextField)
        customizer.customInputField(inputField: passwordTextField)
        customizer.customSignButton(signButton: twitterButton)
        customizer.customSignButton(signButton: googleButton)
        customizer.customSignButton(signButton: facebookButton)
        
        // Delegates
        userTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func companyButtonPressed(_ sender: UIButton) {
        customizer.animationSignButton(btn: sender)
    }
    
    // Log in or register buttons
    @IBAction func sessionButtonPressed(_ sender: UIButton) {
        if let buttonTitle = sender.titleLabel?.text {
            print(buttonTitle)
        }
    }
}

// MARK: - TextFieldDelegate
extension ViewController: UITextFieldDelegate {
    // UIText Handlers
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
