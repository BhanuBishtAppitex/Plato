//
//  PhoneVerificationViewController.swift
//  Plato
//
//  Created by wOOx Technology on 15/11/22.
//

import UIKit

class PhoneVerificationViewController: UIViewController {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var selectCountryButton: UIButton!
    @IBOutlet weak var countryCodeLabel: UILabel!
    
    private var menuAction: [UIAction] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMenu()
    }
    
    @IBAction func dropDownMenu(_ sender: UIButton) {
        print("dropDownMenuPressed")
    }
    
    func updateMenu(){
        selectCountryButton.showsMenuAsPrimaryAction = true
        let data = ModelForPhoneVerification.countries
        print("count = \(data.count)")
        for (key, value) in data {
            print("title = \(key)")
            let action = UIAction(title: key) { action in
                self.countryLabel.text = action.title
                self.countryCodeLabel.text = "+"+value
               
            }
            menuAction.append(action)
        }
        self.selectCountryButton.menu = UIMenu(title: "Select country", children: menuAction)
    }
    
    
}


struct ModelForPhoneVerification {
    static let countries: [String: String] = [
        "India": "91",
        "Pakistam": "92",
        "Nepal": "977",
        "Afghanistan": "93",
        "Albania": "355",
        "Algeria": "213",
        "American Samoa": "1-684",
        "Andorra": "376",
        "Angola": "244",
        "Anguilla": "1-264",
        "Antarctica": "672",
        "Antigua and Barbuda": "1-268",
        "Argentina": "54"
    ]
}
