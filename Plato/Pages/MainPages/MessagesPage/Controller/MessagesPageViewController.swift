//
//  MessagesPageViewController.swift
//  Plato
//
//  Created by wOOx Technology on 15/11/22.
//

import UIKit

class MessagesPageViewController: UIViewController {
    
    
    let nibForMessagesTV: UINib = CellForMessagesPage.nib
    let identifierForMessagesTV: String = CellForMessagesPage.identifier
    let dataForMessagesTV = ModelForMessagesPage.self
    
    // nid/identifier/data for searchContactTableView
    let nib: UINib = CellForSearchContact.nib
    let identifier: String = CellForSearchContact.identifier
    let data = ModelForSearchContact.self
    
    @IBOutlet weak var searchContactStackView: UIStackView!
    @IBOutlet weak var searchContactTopView: UIView!
    @IBOutlet weak var searchContactContainerView: UIView!
    
    @IBOutlet weak var messagesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesTableView.register(nibForMessagesTV, forCellReuseIdentifier: identifierForMessagesTV)
        searchContactStackView.isHidden = true
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        self.searchContactContainerView.backgroundColor = .white
        
        self.searchContactStackView.translatesAutoresizingMaskIntoConstraints = true
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseInOut) {
            self.searchContactStackView.isHidden = false
        }
    }
    
    @IBAction func searchContactTopViewBackButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut) {
            self.searchContactStackView.isHidden = true
        }
    }
}


//MARK: - tableView delegate, dataSource
extension MessagesPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        dataForMessagesTV.profileImage.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell for messagesTableView
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierForMessagesTV, for: indexPath) as! CellForMessagesPage
        let index = indexPath.section
        cell.profileImage.image = UIImage(named: dataForMessagesTV.profileImage[index])
        cell.nameLabel.text = dataForMessagesTV.nameText[index]
        
        // cell selection View
        let view = UIView()
        view.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = view
        
        
        if dataForMessagesTV.isSeen[index] {
            switch dataForMessagesTV.lastMessage[index] {
            case LastMessage.Text:
                cell.messageLabel.isHidden = false
                cell.imageIcon.isHidden = true
                cell.imageText.isHidden = true
                cell.videoIcon.isHidden = true
                cell.videoLabel.isHidden = true
                cell.messageLabel.textColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
                cell.messageLabel.text = dataForMessagesTV.messagesText[index]
            case LastMessage.Image:
                cell.messageLabel.isHidden = true
                cell.imageIcon.isHidden = false
                cell.imageText.isHidden = false
                cell.videoIcon.isHidden = true
                cell.videoLabel.isHidden = true
                cell.imageIcon.tintColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
                cell.imageText.textColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            case LastMessage.Video:
                cell.messageLabel.isHidden = true
                cell.imageIcon.isHidden = true
                cell.imageText.isHidden = true
                cell.videoIcon.isHidden =  false
                cell.videoLabel.isHidden = false
                cell.videoIcon.tintColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
                cell.videoLabel.textColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            }
            cell.timeLabel.isHidden = true
            cell.notificationLabel.isHidden = true
            cell.notificationView.isHidden = true
            
            
        } else {
            switch dataForMessagesTV.lastMessage[index] {
            case LastMessage.Text:
                cell.messageLabel.isHidden = false
                cell.imageIcon.isHidden = true
                cell.imageText.isHidden = true
                cell.videoIcon.isHidden = true
                cell.videoLabel.isHidden = true
                cell.videoLabel.textColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
                cell.messageLabel.textColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
                cell.messageLabel.text = dataForMessagesTV.messagesText[index]
            case LastMessage.Image:
                cell.messageLabel.isHidden = true
                cell.imageIcon.isHidden = false
                cell.imageText.isHidden = false
                cell.videoIcon.isHidden = true
                cell.videoLabel.isHidden = true
                cell.imageIcon.tintColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
                cell.imageText.textColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
            case LastMessage.Video:
                cell.messageLabel.isHidden = true
                cell.imageIcon.isHidden = true
                cell.imageText.isHidden = true
                cell.videoIcon.isHidden =  false
                cell.videoLabel.isHidden = false
                cell.videoIcon.tintColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
                cell.videoLabel.textColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
            }
            if dataForMessagesTV.timeText[index] != "na" {
                cell.timeLabel.isHidden = false
                cell.timeLabel.text = dataForMessagesTV.timeText[index]
            }
            if dataForMessagesTV.notificationText[index] != "na" {
                cell.notificationLabel.isHidden = false
                cell.notificationLabel.text = dataForMessagesTV.notificationText[index]
            }
        }
        return cell
        
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let contentView = UIView()
        let lineVIew = UIView()
        lineVIew.translatesAutoresizingMaskIntoConstraints = false
        lineVIew.backgroundColor = UIColor.black.withAlphaComponent(0.12)
        contentView.addSubview(lineVIew)
        NSLayoutConstraint.activate([
            lineVIew.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lineVIew.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lineVIew.topAnchor.constraint(equalTo: contentView.topAnchor),
            lineVIew.heightAnchor.constraint(equalToConstant: 1)
        ])
        return contentView
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
            tableView.cellForRow(at: indexPath)?.transform = CGAffineTransform(scaleX: 1.025, y: 1.025)
        } completion: { Bool in
            tableView.cellForRow(at: indexPath)?.transform  = .identity
        }
        let storyboard = UIStoryboard(name: "ChatPageStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChatPageViewController")
        present(vc, animated: true)
    }
}
