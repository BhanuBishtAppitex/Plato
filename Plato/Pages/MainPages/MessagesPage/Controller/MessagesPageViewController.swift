//
//  MessagesPageViewController.swift
//  Plato
//
//  Created by wOOx Technology on 15/11/22.
//

import UIKit

class MessagesPageViewController: UIViewController {
    
    let nib: UINib = CellForMessagesPage.nib
    let identifier: String = CellForMessagesPage.identifier
    let data = ModelForMessagesPage.self

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
}


extension MessagesPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.profileImage.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CellForMessagesPage
        let index = indexPath.section
        cell.profileImage.image = UIImage(named: data.profileImage[index])
        cell.nameLabel.text = data.nameText[index]
        
        
        if data.isSeen[index] {
            switch data.lastMessage[index] {
            case LastMessage.Text:
                print("true | text")
                cell.messageLabel.isHidden = false
                cell.imageIcon.isHidden = true
                cell.imageText.isHidden = true
                cell.videoIcon.isHidden = true
                cell.videoLabel.isHidden = true
                cell.messageLabel.textColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
                cell.messageLabel.text = data.messagesText[index]
            case LastMessage.Image:
                print("true | image")
                cell.messageLabel.isHidden = true
                cell.imageIcon.isHidden = false
                cell.imageText.isHidden = false
                cell.videoIcon.isHidden = true
                cell.videoLabel.isHidden = true
                cell.imageIcon.tintColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
                cell.imageText.textColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            case LastMessage.Video:
                print("true | video")
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
            switch data.lastMessage[index] {
            case LastMessage.Text:
                print("false | text")
                cell.messageLabel.isHidden = false
                cell.imageIcon.isHidden = true
                cell.imageText.isHidden = true
                cell.videoIcon.isHidden = true
                cell.videoLabel.isHidden = true
                cell.videoLabel.textColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
                cell.messageLabel.textColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
                cell.messageLabel.text = data.messagesText[index]
            case LastMessage.Image:
                print("false | image")
                cell.messageLabel.isHidden = true
                cell.imageIcon.isHidden = false
                cell.imageText.isHidden = false
                cell.videoIcon.isHidden = true
                cell.videoLabel.isHidden = true
                cell.imageIcon.tintColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
                cell.imageText.textColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
            case LastMessage.Video:
                print("false | video")
                cell.messageLabel.isHidden = true
                cell.imageIcon.isHidden = true
                cell.imageText.isHidden = true
                cell.videoIcon.isHidden =  false
                cell.videoLabel.isHidden = false
                cell.videoIcon.tintColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
                cell.videoLabel.textColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
            }
            if data.timeText[index] != "na" {
                cell.timeLabel.isHidden = false
                cell.timeLabel.text = data.timeText[index]
            }
            if data.notificationText[index] != "na" {
                cell.notificationLabel.isHidden = false
                cell.notificationLabel.text = data.notificationText[index]

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
    }
    
    
    
    
    
    
}
