//
//  StartController.swift
//  WorkBetter
//
//  Created by Denis Karpenko on 29.03.15.
//  Copyright (c) 2015 Denis Karpenko. All rights reserved.
//

import UIKit

class StartController: UIViewController {

    @IBOutlet weak var text: UIImageView!
    @IBOutlet weak var left: UIImageView!
    @IBOutlet weak var right: UIImageView!
    @IBOutlet weak var centr: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        let translateDown = CGAffineTransformMakeTranslation(0, 500)
        let translateUp = CGAffineTransformMakeTranslation(0, -500)
        let translateRight = CGAffineTransformMakeTranslation(500, 0)
        let translateLeft = CGAffineTransformMakeTranslation(-500, 0)
        
        UIView.animateWithDuration(0.7, delay: 0.5,usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            self.left.transform = translateLeft
            },completion:nil)
        UIView.animateWithDuration(0.7, delay: 0.7,usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            self.right.transform = translateRight
            },completion:nil)
        
        UIView.animateWithDuration(0.7, delay: 0.8,usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            self.centr.transform = translateUp
            },completion:nil)
        
        UIView.animateWithDuration(0.7, delay: 0.9,usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            self.text.transform = translateDown
            },completion: {
                (value: Bool) in
                self.performSegueWithIdentifier("Seg", sender: self)
        })


        
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
