//
//  CellForSearchContact.swift
//  Plato
//
//  Created by wOOx Technology on 16/11/22.
//

import UIKit

class CellForSearchContact: UITableViewCell {
    
    static let identifier: String = "CellForSearchContact"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.layer.cornerRadius = profileImage.frame.height/2
    }
    
}
