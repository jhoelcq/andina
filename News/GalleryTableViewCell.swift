//
//  GalleryTableViewCell.swift
//  News
//
//  Created by Francisco Rios on 10/03/23.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var containerCountView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerCountView.layer.cornerRadius = 8
        containerCountView.layer.masksToBounds = true
        
        thumbnail.layer.cornerRadius = 6
        thumbnail.layer.masksToBounds = true
        thumbnail.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
