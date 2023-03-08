//
//  LastedTableViewCell.swift
//  News
//
//  Created by joe on 8/03/23.
//

import UIKit

class LastedTableViewCell: UITableViewCell {

    @IBOutlet weak var customCategory: UILabel!
    
    @IBOutlet weak var customTime: UILabel!
    
    @IBOutlet weak var customImage: UIImageView!
    
    @IBOutlet weak var customTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
