//
//  SettingsContentCell.swift
//  greThesaurus
//
//  Created by Ke Lu on 11/2/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import UIKit

class SettingsContentCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    // @IBOutlet weak var detailLabel: UILabel!
    // @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var switchSwitch: UISwitch!
    
    var content: SettingsContent! {
        didSet {
            nameLabel.text = content.name
            // detailLabel.text = content.detail
            //ratingImageView.image = ratingStars(ratings: content.ratings)
            
            
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    


}
