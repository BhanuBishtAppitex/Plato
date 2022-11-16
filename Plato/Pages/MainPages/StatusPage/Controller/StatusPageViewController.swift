//
//  StatusPageViewController.swift
//  Plato
//
//  Created by wOOx Technology on 16/11/22.
//

import UIKit

class StatusPageViewController: UIViewController {

    @IBOutlet weak var recentAndViewdTV: UITableView!
    
    let nib: UINib = CellForStatusPage.nib
    let identifier: String = CellForStatusPage.identifier
    let data = ModelForStatusPage.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recentAndViewdTV.register(nib, forCellReuseIdentifier: identifier)
    }
}


//MARK: - TableView data source and delegate method
extension StatusPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.sectionName.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection: [Int] = [data.recentlyUpdates.count, data.viewdUpdates.count]
        var rows = 0
        if section < numberOfRowsInSection.count {
            rows = numberOfRowsInSection[section]
        }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CellForStatusPage
        let index = indexPath.row
        if indexPath.section == 0 {
            let newData = data.recentlyUpdates[index]
            DashCornerView.count = newData.numberOfStatus
            cell.nonDashView.isHidden = true
            cell.statusImage.image = UIImage(named: newData.profileImage)
            cell.nameLabel.text = newData.name
            cell.timeLabel.text = newData.time
        } else {
            let newData = data.viewdUpdates[index]
            cell.dashView.isHidden = true
            cell.statusImage2.image = UIImage(named: newData.profileImage)
            cell.nameLabel.text = newData.name
            cell.timeLabel.text = newData.time
        }
        
        //DashCornerView.count = 1
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
        if section == 0 {
            label.text = "Recent Updates"
        } else {
            label.text = "Viewed Updates"
        }
       
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
