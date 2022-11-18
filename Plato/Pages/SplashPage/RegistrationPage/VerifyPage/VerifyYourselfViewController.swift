//
//  VerifyYourselfViewController.swift
//  Plato
//
//  Created by wOOx Technology on 15/11/22.
//

import UIKit

class VerifyYourselfViewController: UIViewController {

    @IBOutlet weak var firstTextField: OTPTextField!
    @IBOutlet weak var secondTextField: OTPTextField!
    @IBOutlet weak var thirdTextField: OTPTextField!
    @IBOutlet weak var fourthTextField: OTPTextField!
    @IBOutlet weak var stackView: UIStackView!
    
    private var currentIndex: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


}


extension VerifyYourselfViewController: UITextFieldDelegate {
    
   
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        changeTextFieldBottomColor(textField: textField)
        if currentIndex == 1 {
            
        }
        
    }
    
    func changeTextFieldBottomColor(textField: UITextField) {
        
        if textField.text != "" {
            switch textField {
            case firstTextField:
                firstTextField.changeBottomColr(color: UIColor(named: C.Colors.accent) ?? .red)
            case secondTextField:
                secondTextField.changeBottomColr(color: UIColor(named: C.Colors.accent) ?? .red)
            case thirdTextField:
                thirdTextField.changeBottomColr(color: UIColor(named: C.Colors.accent) ?? .red)
            case fourthTextField:
                fourthTextField.changeBottomColr(color: UIColor(named: C.Colors.accent) ?? .red)
            default:
                return
            }
        } else {
            switch textField {
            case firstTextField:
                firstTextField.changeBottomColr(color: UIColor(named: C.Colors.textSecondary) ?? .red)
            case secondTextField:
                secondTextField.changeBottomColr(color: UIColor(named: C.Colors.textSecondary) ?? .red)
            case thirdTextField:
                thirdTextField.changeBottomColr(color: UIColor(named: C.Colors.textSecondary) ?? .red)
            case fourthTextField:
                fourthTextField.changeBottomColr(color: UIColor(named: C.Colors.textSecondary) ?? .red)
            default:
                return
            }
        }
        
    }
    
    
}
