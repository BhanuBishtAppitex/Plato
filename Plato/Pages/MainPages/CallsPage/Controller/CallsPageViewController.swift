//
//  CallsPageViewController.swift
//  Plato
//
//  Created by wOOx Technology on 16/11/22.
//

import UIKit

class CallsPageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let nib: UINib = CellForCallsPage.nib
    let identifier: String = CellForCallsPage.identifier
    let data = ModelForCallsPage.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
}

//MARK: - table view delgate/ datasource methods
extension CallsPageViewController: UITableViewDelegate, UITableViewDataSource {
   // func numberOfSections(in tableView: UITableView) -> Int {
   //    // return data.nameText.count
   // }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.nameText.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CellForCallsPage
        let index = indexPath.row
        cell.profileImage.image = UIImage(named: data.mainImage)
        cell.nameLabel.text = data.nameText[index]
        cell.timeLabel.text = data.timeText[index]
        switch data.callIndicatorImage[index]{
        case .Incoming:
            cell.callIndicatorImageView.image = UIImage(named: "IncomingCallIcon")
        case .Outgoing:
            cell.callIndicatorImageView.image = UIImage(named: "OutgoingCallIcon")
        }
        switch data.righSideCallIndicator[index]{
        case .VideCall:
            cell.rightSideCallIndicatorIV.image = UIImage(named: "VideoCallIcon")
        case .PhoneCall:
            cell.rightSideCallIndicatorIV.image = UIImage(named: "AudioCallIcon")
        }
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = UIView()
        sectionHeader.backgroundColor = .clear
        let mainView = UIView()
        mainView.clipsToBounds = true
        mainView.translatesAutoresizingMaskIntoConstraints = false
        sectionHeader.addSubview(mainView)
        mainView.layer.cornerRadius = 20
        mainView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recent Calls"
        label.textColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
        mainView.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9568627451, blue: 1, alpha: 1)
        mainView.addSubview(label)
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: sectionHeader.leadingAnchor),
            mainView.topAnchor.constraint(equalTo: sectionHeader.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: sectionHeader.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10)
        ])
        return sectionHeader
    }
    
    
}
