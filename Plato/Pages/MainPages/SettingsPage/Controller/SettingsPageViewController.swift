//
//  SettingsPageViewController.swift
//  Plato
//
//  Created by wOOx Technology on 16/11/22.
//

import UIKit

class SettingsPageViewController: UIViewController {

    @IBOutlet weak var settingPageTV: UITableView!
    let nib: UINib = CellForSettingsPage.nib
    let identifier: String = CellForSettingsPage.identifier
    let data = ModelForSettingsPage.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingPageTV.register(nib, forCellReuseIdentifier: identifier)
    }
}


//MARK: - tableView data source and delegate
extension SettingsPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.mainText.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CellForSettingsPage
        let index = indexPath.section
        cell.mainImage.image = UIImage(named: data.mainImage[index])
        cell.mainLabel.text = data.mainText[index]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    
}
