//
//  ViewController.swift
//  Plato
//
//  Created by wOOx Technology on 15/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var currentPage: Int = 1
    private let data = ModelForIntroductoryPage.self
    

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var secondText: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var thirdText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func continueButtonPressed(_ sender: UIButton) {
        let numberOfpages = self.data.data.count
        print("numberOfPage | \(numberOfpages)")
        guard currentPage>0 && currentPage<numberOfpages else {
            let storyboard = UIStoryboard(name: "RegistrationStoryboard", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "PhoneVerificationViewController")
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            return
        }
        mainView.translatesAutoresizingMaskIntoConstraints = true
        mainView.frame = CGRect(x: view.frame.width, y: mainView.frame.minY, width: mainView.frame.width, height: mainView.frame.height)
        let newData = self.data.data[currentPage]
        mainImage.image = UIImage(named: newData.mainImage)
        mainText.text = newData.mainTitle
        secondText.text = newData.secondTitle
        button.titleLabel?.text = newData.buttonText
        if newData.thirdText != "" {
            thirdText.text = newData.thirdText
        } else {
            thirdText.isHidden = true
        }
        
        currentPage += 1
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
            self.mainView.frame = CGRect(x: 0, y: self.mainView.frame.minY, width: self.mainView.frame.width, height: self.mainView.frame.height)
            
        } completion: { Bool in
            print("Completed")
        }

    }
    
}

