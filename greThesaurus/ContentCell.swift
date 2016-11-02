//
//  ContentCell.swift
//  greThesaurus
//
//  Created by Ke Lu on 11/2/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    var content: MyWordsContent! {
        didSet {
            nameLabel.text = content.name
            detailLabel.text = content.detail
            ratingImageView.image = ratingStars(ratings: content.ratings)
            
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
    
    func ratingStars(ratings: Int) -> UIImage? {
        let imageName = "\(ratings)Stars"
        return UIImage(named: imageName)
    }

}
