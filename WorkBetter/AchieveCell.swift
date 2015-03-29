//
//  AchieveCell.swift
//  WorkBetter
//
//  Created by Denis Karpenko on 29.03.15.
//  Copyright (c) 2015 Denis Karpenko. All rights reserved.
//

import UIKit

class AchieveCell: UITableViewCell {
    @IBOutlet weak var Description: UILabel!

    @IBOutlet weak var Img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
