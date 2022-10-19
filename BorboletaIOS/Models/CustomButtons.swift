//
//  CustomButtons.swift
//  BorboletaIOS
//
//  Created by Oscar Ramírez Díaz on 14/10/22.
//

import UIKit

struct CustomButtonsInputs {
    // MARK: - Custom Buttons and Inputs
    func customInputField(inputField: UITextField) {
        inputField.layer.cornerRadius = 10
        inputField.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        inputField.layer.shadowOpacity = 0.16
        inputField.layer.shadowRadius = 4
        inputField.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 1))
        inputField.leftView = paddingView
        inputField.leftViewMode = .always
    }
    
    func customButton(button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.shadowOpacity = 0.16
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    func customSignButton(signButton: UIButton) {
        signButton.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        signButton.layer.shadowOpacity = 0.05
        signButton.layer.shadowRadius = 4
        signButton.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    // MARK: - Animations
    func animationSignButton(btn: UIButton) {
        btn.layer.borderWidth = 1.0
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = CGColor(red: 104/255, green: 131/255, blue: 186/255, alpha: 0.5)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            btn.layer.borderWidth = 0.0
            btn.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}
