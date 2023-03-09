//
//  VideosTableViewCell.swift
//  News
//
//  Created by Francisco Rios on 9/03/23.
//

import UIKit

class VideosTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        thumbnail.layer.cornerRadius = 6
        thumbnail.layer.masksToBounds = true
        thumbnail.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
