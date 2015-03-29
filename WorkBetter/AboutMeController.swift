//
//  AboutMeController.swift
//  WorkBetter
//
//  Created by Denis Karpenko on 28.03.15.
//  Copyright (c) 2015 Denis Karpenko. All rights reserved.
//

import UIKit

class AboutMeController: UIViewController {

    @IBOutlet weak var LevelLabel: UILabel!
    @IBOutlet weak var Progress: CounterView!
    @IBOutlet weak var HeroImage: UIImageView!
    @IBOutlet weak var Name: UILabel!
    var Me = Worker(Name:"Denis", Surname: "Karpenko",Job:"Senior IOS Developer", Organization :"LuckyASS",Lvl:3,Rating:3)
    var mass:[String] = []
    override func viewDidLoad() {

        super.viewDidLoad()
        Refresh()
    }
    override func viewDidAppear(animated: Bool) {
        Refresh()
    }
    
    func Refresh() {
        Me = loadData()
        Progress.counterColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
            102.0/255.0, alpha: 1.0)
        Progress.outlineColor = UIColor(red: 74.0/255.0, green: 138.0/255.0, blue:
            74.0/255.0, alpha: 1.0)
        LevelLabel.textColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
            102.0/255.0, alpha: 1.0)
        Progress.counter = Me.rating - (Me.lvl - 1) * 10
        LevelLabel.text = "\(Me.lvl)"
        HeroImage.image = UIImage(named: "\(Me.lvl).png")
        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        Name.textColor = UIColor(red: 102.0/255.0, green: 204.0/255.0, blue:
            102.0/255.0, alpha: 1.0)
        var rect = CGRectMake(100, 40, 50, 15)

        
    }
    
    
    func loadData() ->Worker{
        let url = NSURL(string: "http://workbetter.mybluemix.net/TakeOne?name=Denis&surname=Karpenko")
        var request = NSURLRequest(URL: url!)
        var Wor = Worker(Name:"Denis", Surname: "Karpenko",Job:"Senior IOS Developer", Organization :"LuckyASS",Lvl:3,Rating:3)
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
        if data != nil {
            var hoge = JSON(data: data!)
            if(hoge != nil){
                Wor = Worker(Name: hoge["name"].string!, Surname: hoge["surname"].string!, Job: hoge["job"].string!, Organization: hoge["org"].string!, Lvl: hoge["lvl"].int!, Rating: hoge["raiting"].int!)
                for elem in hoge["achives"]{
                    mass.append(elem.1.string!)
                    println(elem.1.string!)
                }
                //println(mass)
            }
        }
        return Wor
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