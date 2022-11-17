//
//  ChatPageViewController.swift
//  Plato
//
//  Created by wOOx Technology on 17/11/22.
//

import UIKit

class ChatPageViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var chatBodyView: UIView!
    
    @IBOutlet weak var sharingOption: UIView!
    @IBOutlet weak var sharingOptionBackgroundView: UIView!
    @IBOutlet weak var sharingOptionView: UIView!
    
    var attachmentOpen: Bool = false
    
    // data, nib, identifier for chatTableView
    let identifier: String = CellForChats.identifier
    let nib: UINib = CellForChats.nib
    let data = ModelForChats.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.register(nib, forCellReuseIdentifier: identifier)
        updateInitialView()
        
        
    }
    
    func updateInitialView(){
        sharingOptionView.backgroundColor = UIColor(named: C.Colors.white)
        sharingOptionView.layer.cornerRadius = 20
        sharingOptionView.layer.borderWidth = 2
        sharingOptionView.layer.borderColor = UIColor(named: C.Colors.accentBlur)?.cgColor
        sharingOptionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        sharingOptionBackgroundView.backgroundColor = .clear
        
        
        // blur background
        let blurView = UIVisualEffectView()
        // Make its frame equal the main view frame so that every pixel is under blurred
        blurView.frame = sharingOptionBackgroundView.frame
        // Choose the style of the blur effect to regular.
        // You can choose dark, light, or extraLight if you wants
        blurView.effect = UIBlurEffect(style: .extraLight)
        // Now add the blur view to the main view
        sharingOptionBackgroundView.addSubview(blurView)
        
        topView.tintColor = UIColor(named: C.Colors.accent)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.backgroundViewPressed))
        sharingOptionBackgroundView.addGestureRecognizer(gesture)
    }
    
    @objc
    func backgroundViewPressed(){
        print("Background view pressed")
        UIView.animate(withDuration: 1.0, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
            self.sharingOption.isHidden = true
        } completion: { Bool in
            self.attachmentOpen.toggle()
        }

    }
    
    @IBAction func attachmentButtonPressed(_ sender: UIButton) {
        print("Attachment Button Pressed")
        if !attachmentOpen {
            UIView.animate(withDuration: 1.0, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
                self.sharingOption.isHidden = false
            } completion: { Bool in
                self.attachmentOpen.toggle()
            }
        }
    }
}


//MARK: - tableview datasource/delgate methods
extension ChatPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.messages.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CellForChats
        
        // selector view
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: cell.backView.frame.width+5, height: cell.backView.frame.height+5)
        view.layer.cornerRadius = 10
        view.backgroundColor = .clear// #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 0.5).withAlphaComponent(0.125)
        cell.selectedBackgroundView = view
        
        
        cell.contentView.layer.shadowRadius = 5
        cell.contentView.layer.shadowOpacity = 0.5
    
        let index = indexPath.section
        let newData = data.messages[index]
        
        if newData.sender == .User {
            cell.contentView.layer.shadowColor = UIColor(named: C.Colors.accent)?.cgColor
            cell.contentView.layer.shadowOffset = CGSize(width: -5, height: 5)
            
            cell.rightView.isHidden = true
            cell.backView.backgroundColor = UIColor(named: C.Colors.accent)
            cell.messageLabel.textColor = UIColor(named: C.Colors.white)
            cell.timeLabel.textColor = UIColor(named: C.Colors.white)
            
        } else if newData.sender == .Other {
            cell.contentView.layer.shadowColor = UIColor(named: C.Colors.accentBlur)?.cgColor
            cell.contentView.layer.shadowOffset = CGSize(width: 5, height: 5)
            
            cell.leftView.isHidden = true
            cell.backView.backgroundColor = UIColor(named: C.Colors.white)
            cell.messageLabel.textColor = UIColor(named: C.Colors.textPrimary)
            cell.timeLabel.textColor = UIColor(named: C.Colors.textSecondary)
        }
        cell.messageLabel.text = newData.messageText
        cell.timeLabel.text = newData.timeText
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
            tableView.cellForRow(at: indexPath)?.transform = CGAffineTransform(scaleX: 1.02, y: 1.02)
        } completion: { Bool in
            tableView.cellForRow(at: indexPath)?.transform = .identity
        }

        
    }
    
    
}
