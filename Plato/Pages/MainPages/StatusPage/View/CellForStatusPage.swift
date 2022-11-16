//
//  CellForStatusPage.swift
//  Plato
//
//  Created by wOOx Technology on 16/11/22.
//

import UIKit

class CellForStatusPage: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var statusImage2: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dashView: DashCornerView!
    @IBOutlet weak var nonDashView: UIView!
    
    
    static let identifier: String = "CellForStatusPage"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        statusImage.layer.cornerRadius = statusImage.frame.height/2
        statusImage.layer.borderWidth = 1
        statusImage.layer.borderColor = UIColor.clear.cgColor
        statusImage2.layer.cornerRadius = statusImage.frame.height/2
        statusImage2.layer.borderWidth = 1
        statusImage2.layer.borderColor = UIColor.clear.cgColor
    
    
    }
    
}
