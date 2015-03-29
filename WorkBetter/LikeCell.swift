//
//  LikeCell.swift
//  WorkBetter
//
//  Created by Denis Karpenko on 28.03.15.
//  Copyright (c) 2015 Denis Karpenko. All rights reserved.
//

import UIKit

class LikeCell: UITableViewCell {
    var name : String = ""
    var surname: String = ""
    var like = 0
    @IBAction func PushBtn(sender: AnyObject) {
        if(like == 0){
            like = 1
            LikeButton.setImage(UIImage(named: "like.png"), forState: UIControlState.Normal)
            let url = NSURL(string: "http://workbetter.mybluemix.net/OneLike?name=\(name)&surname=\(surname)")
            //println("http://workbetter.mybluemix.net/")
            var request = NSURLRequest(URL: url!)
            var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        }
        else{
            like = 0
            LikeButton.setImage(UIImage(named: "like_grey.png"), forState: UIControlState.Normal) // Сюда надо серую картинку
            let url = NSURL(string: "http://workbetter.mybluemix.net/UnOneLike?name=\(name)&surname=\(surname)")
            //println("http://workbetter.mybluemix.net/")
            var request = NSURLRequest(URL: url!)
            var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)

        }

        
        
    }
    @IBOutlet weak var LikeButton: UIButton!
    @IBOutlet weak var FullName: UILabel!
    override func awakeFromNib() {
                super.awakeFromNib()
        if(like == 0){
            LikeButton.setImage(UIImage(named: "like_grey.png"), forState: UIControlState.Normal) // Серую картинку !!
        }
        else{
            LikeButton.setImage(UIImage(named: "like.png"), forState: UIControlState.Normal)
        }

        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
