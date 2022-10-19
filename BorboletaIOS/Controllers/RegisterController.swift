//
//  RegisterController.swift
//  BorboletaIOS
//
//  Created by Oscar Ramírez Díaz on 15/10/22.
//

import UIKit
import Firebase

class RegisterController: UIViewController {
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var repeatPasswordInput: UITextField!
    
    
    
    
    
    let customizer = CustomButtonsInputs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Establishing delegates
        emailInput.delegate = self
        passwordInput.delegate = self
        repeatPasswordInput.delegate = self
        
        customizer.customInputField(inputField: emailInput)
        customizer.customInputField(inputField: passwordInput)
        customizer.customInputField(inputField: repeatPasswordInput)
    }
    
    
    @IBAction func continuePressed(_ sender: UIButton) {
        if emailInput.text != "" {
            if passwordInput.text != "" && repeatPasswordInput.text != "" {
                if passwordInput.text == repeatPasswordInput.text {
                    self.performSegue(withIdentifier: "goToSecondRegistration", sender: self)
                } else {
                    print("Passwords don't match")
                }
            } else {
                print("Please enter password")
            }
        } else {
            print("Please enter your email")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondRegistration" {
            let destinationVC = segue.destination as? RegisterTwoController
            destinationVC?.user.email = emailInput.text!
            destinationVC?.user.password = passwordInput.text!
        }
    }
}

extension RegisterController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
