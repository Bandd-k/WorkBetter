//
//  BAR.swift
//  WorkBetter
//
//  Created by Denis Karpenko on 28.03.15.
//  Copyright (c) 2015 Denis Karpenko. All rights reserved.
//

import UIKit

class BAR: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
            102.0/255.0, alpha: 1.0)
        var tabBarItem1 = tabBar.items?[0] as UITabBarItem
        var tabBarItem2 = tabBar.items?[1] as UITabBarItem
        var tabBarItem3 = tabBar.items?[2] as UITabBarItem
        var Img = UIImageView(image: UIImage(named: "bm.png"))
        Img.frame.size.height = 10
        Img.frame.size.width = 10
        tabBarItem1.image = Img.image
        Img = UIImageView(image: UIImage(named: "like.png"))
        Img.frame.size.height = 45
        Img.frame.size.width = 45
        tabBarItem2.image = Img.image
        Img = UIImageView(image: UIImage(named: "idea.png"))
        Img.frame.size.height = 45
        Img.frame.size.width = 45
        tabBarItem3.image = Img.image
        self.navigationItem.title = "Me"
        self.navigationItem.hidesBackButton = true
        


        
        
        
        
        // Do any additional setup after loading the view.
    }
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        self.navigationItem.title = item.title
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
