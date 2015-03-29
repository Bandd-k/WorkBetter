//
//  IdeaCell.swift
//  WorkBetter
//
//  Created by Denis Karpenko on 28.03.15.
//  Copyright (c) 2015 Denis Karpenko. All rights reserved.
//

import UIKit

class IdeaCell: UITableViewCell {
var like = 0
    var id = 0
    var lks = 0
    @IBOutlet weak var TextHolder: UITextView!
    @IBAction func PushBtn(sender: AnyObject) {
        if(like == 1){
            LikeButton.setImage(UIImage(named: "like_grey.png"), forState: UIControlState.Normal) // Серую картинку !!
            lks = lks - 1
            LikeLabel.text = "\(lks)"
            let url = NSURL(string: "http://workbetter.mybluemix.net/UnLikeIdea?idea_id=\(id)")
            var request = NSURLRequest(URL: url!)
            var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
            
            LikeLabel.textColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue:
                128.0/255.0, alpha: 1.0)
            like = 0
        }
        else{
            let url = NSURL(string: "http://workbetter.mybluemix.net/LikeIdea?idea_id=\(id)")
            var request = NSURLRequest(URL: url!)
            var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
            LikeLabel.textColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
                102.0/255.0, alpha: 1.0)
            lks = lks + 1
            LikeLabel.text = "\(lks)"
            LikeButton.setImage(UIImage(named: "like.png"), forState: UIControlState.Normal)
            like = 1
        }
        
    }
    @IBOutlet weak var TextBackground: UIImageView!
    @IBOutlet weak var LikeLabel: UILabel!
    @IBOutlet weak var LikeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        LikeLabel.textColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
            102.0/255.0, alpha: 1.0)
        TextHolder.textColor =  UIColor.whiteColor()
        // Initialization code
        if(like == 0){
            LikeButton.setImage(UIImage(named: "like_grey.png"), forState: UIControlState.Normal) // Серую картинку !!
            LikeLabel.textColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue:
                128.0/255.0, alpha: 1.0)
        }
        else{
            LikeLabel.textColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
                102.0/255.0, alpha: 1.0)
            LikeButton.setImage(UIImage(named: "like.png"), forState: UIControlState.Normal)
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
