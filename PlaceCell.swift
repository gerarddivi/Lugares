//
//  PlaceCell.swift
//  Lugares
//
//  Created by Gerard Divi on 4/10/16.
//  Copyright © 2016 Gerard Divi. All rights reserved.
//

import UIKit

class PlaceCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var favouriteImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var ingredientsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
