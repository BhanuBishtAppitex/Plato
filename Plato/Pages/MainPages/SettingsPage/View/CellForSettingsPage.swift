//
//  CellForSettingsPage.swift
//  Plato
//
//  Created by wOOx Technology on 16/11/22.
//

import UIKit

class CellForSettingsPage: UITableViewCell {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    static let identifier: String = "CellForSettingsPage"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
