//
//  CustomTextField.swift
//  Plato
//
//  Created by wOOx Technology on 15/11/22.
//

import UIKit

class CustomTextField: UITextField {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateView()
    }
    
    func updateView() {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = leftView
        leftViewMode = .always
        self.font = UIFont(name: C.Fonts.regular, size: 14)
        
        layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer.borderWidth = 0.0
        layer.masksToBounds = false
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.bounds.width, height: 1)
        bottomLine.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.125).cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
        
    }
    
}

class OTPTextField: UITextField {
    var bottomColor: UIColor = UIColor(named: C.Colors.accent)!
    let view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateView()
    }
    
    func changeBottomColr(color: UIColor){
        UIView.animate(withDuration: 1.0, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
            self.view.backgroundColor = color
        }
    }
    
    func updateView() {
        self.textAlignment = .center
        borderStyle = .none
        layer.masksToBounds = false
        addBottomLine() 
    }
    
    func addBottomLine(){
        view.frame = CGRect(x: 0, y: self.bounds.maxY, width: self.bounds.width, height: 2)
        view.backgroundColor = UIColor(named: C.Colors.textSecondary)
        addSubview(view)
    }
    
    
    
}
