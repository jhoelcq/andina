//
//  MyNewsTableViewCell.swift
//  News
//
//  Created by Francisco Rios on 10/03/23.
//

import UIKit

class MyNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var sectionLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    @IBOutlet weak var thumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
        
        thumbnail.layer.cornerRadius = 6
        thumbnail.layer.masksToBounds = true
        thumbnail.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
