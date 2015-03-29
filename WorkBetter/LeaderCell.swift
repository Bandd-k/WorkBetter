//
//  LeaderCell.swift
//  WorkBetter
//
//  Created by Denis Karpenko on 29.03.15.
//  Copyright (c) 2015 Denis Karpenko. All rights reserved.
//

import UIKit

class LeaderCell: UITableViewCell {

    @IBOutlet weak var Place: UILabel!
    @IBOutlet weak var FullName: UILabel!
    @IBOutlet weak var Rating: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        Place.textColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
            102.0/255.0, alpha: 1.0)
        FullName.textColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
            102.0/255.0, alpha: 1.0)
        Rating.textColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
            102.0/255.0, alpha: 1.0)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
