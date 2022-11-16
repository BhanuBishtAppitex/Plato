//
//  SearchContactViewController.swift
//  Plato
//
//  Created by wOOx Technology on 16/11/22.
//

import UIKit

class SearchContactViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let nib: UINib = CellForSearchContact.nib
    let identifier: String = CellForSearchContact.identifier
    let data = ModelForSearchContact.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
}


//MARK: -
extension SearchContactViewController: UITableViewDelegate, UITableViewDataSource {
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.categoryString.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection: [Int] = [data.platoContact.count, data.otherContact.count]
        var rows = 0
        if section < numberOfRowsInSection.count {
            rows = numberOfRowsInSection[section]
        }
        return rows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CellForSearchContact
        let index = indexPath.row
        if indexPath.section == 0 {
            let newData = data.platoContact[index]
            cell.profileImage.image = UIImage(named: PlatoContacts.profileImage)
            cell.nameLabel.text = newData.nameText
            cell.statusLabel.text = newData.statusText
        } else {
            let newData = data.otherContact[index]
            cell.profileImage.image = UIImage(named: OtherContacts.profileImage)
            cell.nameLabel.text = newData.nameText
            cell.statusLabel.isHidden = true
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
        if section == 0 {
            label.text = "Plato Contacts"
        } else {
            label.text = "Other Contacts"
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
