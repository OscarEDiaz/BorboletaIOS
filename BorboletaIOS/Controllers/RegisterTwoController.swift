//
//  RegisterTwoController.swift
//  BorboletaIOS
//
//  Created by Oscar Ramírez Díaz on 16/10/22.
//

import UIKit
import Firebase

class RegisterTwoController: UIViewController {

    @IBOutlet weak var genrePopUpButton: UIButton!
    @IBOutlet weak var pronounPopUpButton: UIButton!
    @IBOutlet weak var imagePickerButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var middleNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    let customizer = CustomButtonsInputs()
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        middleNameTextField.delegate = self
        lastNameTextField.delegate = self
        
        setPopUpGenreButton()
        customizer.customButton(button: imagePickerButton)
        customizer.customButton(button: genrePopUpButton)
        customizer.customButton(button: pronounPopUpButton)
        
        customizer.customInputField(inputField: nameTextField)
        customizer.customInputField(inputField: middleNameTextField)
        customizer.customInputField(inputField: lastNameTextField)
    }
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if nameTextField.text == "" || middleNameTextField.text == "" || lastNameTextField.text == "" {
            Auth.auth().createUser(withEmail: user.email!, password: user.password!) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    print("Registered") // Go to Filters
                }
            }
        } else {
            print("Invalid data")
        }
        
        // Add user data to firebase db
        // Check if given email already exists, if not, store
    }
    
    
    @IBAction func addPhotoPressed(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    
    func setPopUpGenreButton() {
        let optionClosure = {(action: UIAction) in
            self.user.genre = action.title
            print(action.title)
        }
        
        let secondOptionCLosure = {(action: UIAction) in
            self.user.pronoun = action.title
            print(action.title)
        }
        
        genrePopUpButton.menu = UIMenu(children: [
            UIAction(title: "Masculino", state: .on, handler: optionClosure),
            UIAction(title: "Femenino", handler: optionClosure),
            UIAction(title: "Otro", handler: optionClosure)])
        
        genrePopUpButton.showsMenuAsPrimaryAction = true
        genrePopUpButton.changesSelectionAsPrimaryAction = true
        
        pronounPopUpButton.menu = UIMenu(children: [
            UIAction(title: "Él", state: .on, handler: secondOptionCLosure),
            UIAction(title: "Ella", handler: secondOptionCLosure),
            UIAction(title: "Elle", handler: secondOptionCLosure)])
        
        pronounPopUpButton.showsMenuAsPrimaryAction = true
        pronounPopUpButton.changesSelectionAsPrimaryAction = true
        
    }
    
    
}

extension RegisterTwoController: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}

extension RegisterTwoController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Got image!
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            // Update firebase
            print(image.size)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
