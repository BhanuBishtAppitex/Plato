//
//  VerifyYourselfViewController.swift
//  Plato
//
//  Created by wOOx Technology on 15/11/22.
//

import UIKit

class VerifyYourselfViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}


extension VerifyYourselfViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("did begin edititn")
        stackView.spacing = 30
    }
}
